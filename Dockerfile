server:
    port: 80 #博客端口号
    compression:
        min-response-size: 512 #压缩文件最小大小(kb)
        enabled: true #是否压缩
        mime-types: text/html,text/css,text/javascript,application/javascript,image/gif,image/png,image/jpg #要压缩的文件格式
    undertow:
        io-threads: 4 #io线程数
        worker-threads: 10 #工作线程数
        buffer-size: 16384 #每个缓冲的字节数
        accesslog:
            enabled: true #是否开启undertow日志
            dir: /home/jcala/blog/log/server_log #undertow日志目录
            pattern: combined #日志格式
logging:
    config: classpath:logback-spring.xml #logback配置文件
    path: /home/jcala/blog/log/spring_log #logback日志目录
spring:
    velocity:
        cache: true #velocity是否开启缓存
        charset: UTF-8
        view-names: error,index,projects,tags,tagView,archives,post,about,login,admin/blog_add,admin/project, 
                    admin/moniter,admin/blog_modify,admin/blog_list,admin/info,admin/result,admin/resume
                    #允许的vm名称，新建的vm文件要想使用必须在此注册
        properties:
          input.encoding: UTF-8
          output.encoding: UTF-8
          velocimacro.library: VM_global_library.vm #velocity的宏文件
          directive.parse.max.depth: 2 #parse解析的深度
    http:
        encoding.charset: UTF-8
        encoding.force: false
        multipart:
          max-file-size: 3MB #上传文件最大的大小，因此上传的图片不可超过这个大小，否则抛出异常
          max-request-size: 10MB
    cache:
        cache-names: ehcache #设置缓存的实现为ehcache
        ehcache:
            config: ehcache.xml #ehcache的配置文件
    datasource:
        type: com.zaxxer.hikari.HikariDataSource #数据库连接池为hikariCP
        username: root #数据库访问用户名
        password: root #数据库访问密码
        url: jdbc:mysql://127.0.0.1:3306/jcala_blog?useUnicode:true&amp;characterEncoding:UTF-8
        driverClassName: com.mysql.jdbc.Driver
        schema: classpath:import.sql #数据库表结构
        data: classpath:data.sql #数据库初始化数据
        initialize: false #是否初始化数据库。true的话则执行import.sql,data.sql sql语句，导入表结构和初始化数据
        sql-script-encoding: UTF-8 #导入的sql文件编码
        hikari:
            connection-timeout: 30000
            maximum-pool-size: 50 #数据库连接池最大连接数
            minimum-idle: 5 #初始连接池的连接数
mybatis:
    type-aliases-package: me.jcala.blog.domain,me.jcala.blog.mapping
    type-handlers-package: org.apache.ibatis.type.LocalDateTypeHandler
    config-location: classpath:mybatis-config.xml #mybatis配置文件
reverse:
    domain: http://127.0.0.1:8090 #静态资源服务器的访问根路径
    root: G:\home\jcala\blog\static #静态资源服务器的文件根路径
