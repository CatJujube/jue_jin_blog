# Spring IOC(inverstion of control,控制反转)

# Spring DI(dependency injection,依赖注入)

# Spring AOP(aspect oriented programming,面向切面编程)
AOP是OOP的延续，是Spring框架中的一个重要内容。OOP的特点是继承、封装和多态，同时将系统分解为多个对象的交互，但是这样会存在着逻辑和代码冗余的问题。如我们有一个OOP的业务组件BookService，基于OOP的思想代码中会存在着一些冗余的部分，如安全检查、事务处理和日志记录：
```
public class BookService {
    public void createBook(Book book) {
        securityCheck();    //安全检查
        Transaction tx = startTransaction();
        try {
            // 核心业务逻辑
            tx.commit();    //事务处理
        } catch (RuntimeException e) {
            tx.rollback();
            throw e;
        }
        log("created book: " + book); //日志记录
    }
    
    public void updateBook(Book book) {
        securityCheck();    //安全检查
        Transaction tx = startTransaction();
        try {
            // 核心业务逻辑
            tx.commit();    //事务处理
        } catch (RuntimeException e) {
            tx.rollback();
            throw e;
        }
        log("created book: " + book); //日志记录
    }
}
```

而AOP则是基于代理模式，将系统分割成不同的关注点（切面），可以在不改变原有代码逻辑的基础上新增内容。AOP技术本质就是一个动态代理，让我们把一些常用功能如权限检查、日志、事务等，从每个业务方法中剥离出来。
```
public class SecurityCheckBookService implements BookService {
    private final BookService target;

    public SecurityCheckBookService(BookService target) {
        this.target = target;
    }

    public void createBook(Book book) {
        securityCheck();
        target.createBook(book);
    }

    public void updateBook(Book book) {
        securityCheck();
        target.updateBook(book);
    }

    public void deleteBook(Book book) {
        securityCheck();
        target.deleteBook(book);
    }

    private void securityCheck() {
        ...
    }
}
```

在Java平台上，对于AOP的织入，有3种方式：
- **编译期**：在编译时，由编译器把切面调用编译进字节码，这种方式需要定义新的关键字并扩展编译器，AspectJ就扩展了Java编译器，使用关键字aspect来实现织入；
- **类加载器**：在目标类被装载到JVM时，通过一个特殊的类加载器，对目标类的字节码重新“增强”；
- **运行期**：目标对象和切面都是普通Java类，通过JVM的动态代理功能或者第三方库实现运行期动态织入。