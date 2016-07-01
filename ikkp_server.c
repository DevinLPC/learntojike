#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h> //close()
#include <errno.h>
#include <signal.h>

void error(char *msg)
{
	fprintf(stderr, "%s: %s\n",msg,strerror(errno) );
	exit(1);
}

/*
注册处理器函数
参数： 信号编号，处理器函数指针
*/
int  catch_signal(int sig,void (*handler)(int))
{
	struct sigaction action;
	action.sa_handler = handler;
	sigemptyset(&action.sa_mask);
	action.sa_flags = 0;
	return sigaction(sig,&action,NULL);
}

int open_listener_socket()
{
	int s = socket(PF_INET,SOCK_STREAM,0);
	if(s == -1)
		error("无法打开套接字");
	return s;
}

void bind_to_port(int socket,int port)
{
	struct sockaddr_in name;
	name.sin_family = PF_INET;
	name.sin_port =(in_port_t)htons(30000);
	name.sin_addr.s_addr = htonl(INADDR_ANY);
	//这些代码创建一个表示"互联网30000端口"套接字名
	int  reuse = 1;
	//需要一个整形量来保存选项。
	//设置为1，表示重新使用端口
	if(setsockopt(socket,SOL_SOCKET,SO_REUSEADDR,(char*)&reuse,sizeof(int)) == -1)
		error("无法设置套接字的\"重新使用端口\"选项");
	if(bind(socket,(struct sockaddr *)&name,sizeof(name)) == -1)
		error("无法绑定端口");

}

int read_in(int socket, char *buf,int len)
{
    char *s = buf;
    int slen = len;
    int c = recv(socket,s,slen,0);
    while((c >0)&&(s[c-1] != '\n')){
    s += c;
    slen -= c;
    c = recv(socket,s,slen,0);
    }
    if(c <0)
    return c;
    else if(c == 0)
        buf[0] = '\0';
    else
        s[c-1] = '\0';
    return len - slen;
}
/*
向客户端发送字符串
*/
int say(int socket,char *s)
{
	int result = send(socket,s,strlen(s),0);
	if(result == -1)
		fprintf(stderr, "%s:%s\n", "和客户端通信时发生错误",strerror(errno));
	return result;
}

int listener_d;//它将保存服务器的主监听套接字
/*
如果有人在服务器运行期间按住了Ctrl+C，这个函数就会在程序结束前关闭套接字
*/
void handle_shutdown(int sig)
{
	if(listener_d)
		close(listener_d);
	fprintf(stderr,"Bye!\n");
	exit (0);
}

int main(int argc, char const *argv[])
{
	if(catch_signal(SIGINT,handle_shutdown) == -1)
		error("Can't set the interrupt handler");
	listener_d = open_listener_socket();
	bind_to_port(listener_d,30000);
	if(listen(listener_d,10) == -1)
		error("can't listen");
	struct sockaddr_storage client_addr;
	unsigned int address_size = sizeof(client_addr);
	puts("Waiting for connection");
	char buf[255];
	while(1)
	{
		int connect_d = accept(listener_d,(struct sockaddr *)&client_addr,&address_size);
		if(connect_d == -1)
			error("Can't open secondary socket");
		if(!fork()) //创建子进程，如果fork返回0，就说明你在子进程中
		{
			close(listener_d);//在子进程需要关闭住监听套接字，子进程只用connect_d和客户端通信。
			if(say(connect_d,"Jnternet Knock-Knock Protocol server \r\nVersion 1.0\r\nKnkck! Knock!\r\n") != -1)
				read_in(connect_d,buf,sizeof(buf));
			if(strncasecmp("Who's there?",buf,12))
				say(connect_d,"You should say 'Who's there?'！");
			else{
				if(say(connect_d,"Oscar\r\n") != -1){
					read_in(connect_d,buf,sizeof(buf));
					if(strncasecmp("Oscar who?",buf,10))
						say(connect_d,"You should say 'Oscar Who?'!\r\n");
					else
						say(connect_d,"Oscar silly question,you get a silly answer\r\n");
				}
			}
			close(connect_d);
			exit(0);//退出子进程，防止子进程进入服务器的主循环。
		}
		close(connect_d);

	} 
	
	return 0;
}