package hallnet.webcast;

import java.io.IOException;
import java.security.GeneralSecurityException;

import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import su.litvak.chromecast.api.v2.ChromeCast;
import su.litvak.chromecast.api.v2.ChromeCasts;
import su.litvak.chromecast.api.v2.Status;

@Path("/cast")
public class WebCast {
	
	private static String MEDIA_RECEIVER_ID = "4F8B3483";
	
	@POST
	@Produces(MediaType.TEXT_PLAIN)
	@Path("/media")
	public String castURL(@FormParam("url") String url) {
		System.out.println("castURL(" + url + ") called.");
		try {
			ChromeCasts.startDiscovery();
			Thread.sleep(1000);
			for(ChromeCast chromecast : ChromeCasts.get()) {
				chromecast.connect();
				Status status = chromecast.getStatus();
				if(chromecast.isAppAvailable(MEDIA_RECEIVER_ID) && !status.isAppRunning(MEDIA_RECEIVER_ID))
					chromecast.launchApp(MEDIA_RECEIVER_ID);
				chromecast.load(url);
				chromecast.disconnect();
			}
			
			ChromeCasts.stopDiscovery();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return "Started video at " + url;
	}
	
	@GET
	@Produces(MediaType.TEXT_PLAIN)
	public String test() {
		return "ok";
	}
}
