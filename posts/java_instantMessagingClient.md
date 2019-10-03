# Making an instant messaging client in Java
I've always wanted to explore Java's client/server packages, and I thought a
fun way to do this would be to build an instant messaging app for myself and
my friends!

Source: https://stackoverflow.com/questions/8542565/how-to-make-a-basic-instant-messaging-program-in-pure-java

Here's a basic implementation:
```
import java.io.IOException;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Date;

/**
 * A simple TCP server. When a client connects, it sends the client the current
 * datetime, then closes the connection. This is arguably the simplest server
 * you can write. Beware though that a client has to be completely served its
 * date before the server will be able to handle another client.
 */
public class DateServer {
    public static void main(String[] args) throws IOException {
		ServerSocket listener = new ServerSocket(59090);

		while(true) {
			try (Socket socket = listener.accept()) {
				System.out.println("A client has connected");
				
				try (PrintWriter out = new PrintWriter(socket.getOutputStream(), true)) {
					out.println("Hello, the current date is " + new Date().toString());
				} catch (Exception e) {
					System.out.println(e);
				}
			} catch (Exception e) {
				System.out.println(e);
			}
		}
	}
}
```
