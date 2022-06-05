package EntityManagers;

public class ClassLoader {
   public ClassLoader(){
       try {
           Class<?> aClass = Class.forName("org.postgresql.Driver");
       } catch (ClassNotFoundException e) {
           e.printStackTrace();
       };
   }
}
