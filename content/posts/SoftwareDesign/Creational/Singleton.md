### Singleton

```java
class Singleton {
		private static Singleton instance = new Singleton();
		private Singleton() { ... };
		public static Singleton getInstance(){
				return instance;
		}
}
```

```java
class Singleton {
		private static Singleton instance;
		private Singleton() { ... };
		public static Singleton getInstance(){
      	if (instance == null){
          	instance = new Singleton();
        }
				return instance;
		}
}
```

