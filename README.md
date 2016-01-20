# firstBlog

siege 学习笔记

用法举例：

siege -c 300 -r 100 -f url.txt

说明：-c是并发量，-r是重复次数。url.txt就是一个文本文件，每行都是一个url，它会从里面随机访问的。


参数详解：

-C,或–config 在屏幕上打印显示出当前的配置,配置是包括在他的配置文件$HOME/.siegerc中,可以编辑里面的参数,这样每次siege 都会按照它运行.

-v 运行时能看到详细的运行信息

-c n,或–concurrent=n 模拟有n个用户在同时访问,n不要设得太大,因为越大,siege 消耗本地机器的资源越多

-i,–internet 随机访问urls.txt中的url列表项,以此模拟真实的访问情况(随机性),当urls.txt存在是有效

-d n,–delay=n hit每个url之间的延迟,在0-n之间

-r n,–reps=n 重复运行测试n次,不能与 -t同时存在

-t n,–time=n 持续运行siege ‘n’秒(如10S),分钟(10M),小时(10H)

-l 运行结束,将统计数据保存到日志文件中siege .log,一般位于/usr/local/var/siege .log中,也可在.siegerc中自定义

-R SIEGERC,–rc=SIEGERC 指定用特定的siege 配置文件来运行,默认的为$HOME/.siegerc

-f FILE, –file=FILE 指定用特定的urls文件运行siege ,默认为urls.txt,位于siege 安装目录下的etc/urls.txt

-u URL,–url=URL 测试指定的一个URL,对它进行”siege “,此选项会忽略有关urls文件的设定

urls.txt文件：是很多行待测试URL的列表以换行符断开,格式为:

[protocol://]host.domain.com[:port][path/to/file]

原文地址：http://www.2cto.com/kf/201503/385532.html

结果说明：

** SIEGE 2.72
** Preparing 300 concurrent users for battle.
The server is now under siege.. done.

Transactions: 30000 hits //完成30000次处理

Availability: 100.00 % //100.00 % 成功率

Elapsed time: 68.59 secs //总共使用时间

Data transferred: 817.76 MB //共数据传输 817.76 MB

Response time: 0.04 secs //响应时间，显示网络连接的速度

Transaction rate: 437.38 trans/sec //平均每秒完成 437.38 次处理

Throughput: 11.92 MB/sec //平均每秒传送数据

Concurrency: 17.53 //实际最高并发连接数

Successful transactions: 30000 //成功处理次数

Failed transactions: 0 //失败处理次数

Longest transaction: 3.12 //每次传输所花最长时间

Shortest transaction: 0.00 //每次传输所花最短时间

50个用户（每次并发量，注意不是每秒并发量） 重复100次 共产生 50 * 100 = 5000个请求

/usr/local/siege/bin/siege -c 50 -r 100 https://www.abc.com/fcgi-bin/rs/

50个用户 重复100次 发送GET参数

/usr/local/siege/bin/siege -c 50 -r 100 https://www.abc.com/fcgi-bin/rs/?name=zhangsan

50个用户 重复100次 发送POST参数 (注意引号)

/usr/local/siege/bin/siege -c 50 -r 100 https://www.abc.com/fcgi-bin/rs/ POST name=zhangsan

50个用户 重复100次 发送POST参数(从文件中读取)

/usr/local/siege/bin/siege -c 50 -r 100 https://www.abc.com/fcgi-bin/rs/ POST < /root/ab_test/post.xml

另外还有发送时间参数等

详情请man 或 siege -h
