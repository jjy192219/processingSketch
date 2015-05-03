import com.temboo.core.*;
import com.temboo.Library.LinkedIn.PeopleAndConnections.*;


// Create a session using your Temboo account application details
TembooSession session = new TembooSession("ericjiang", "linkedinApp", "e58a81ee7b5a4d4a8d42d3feed143a0a");

void setup() {
  // Run the GetUserConnections Choreo function
  runGetUserConnectionsChoreo();
}

void runGetUserConnectionsChoreo() {
  // Create the Choreo object using your Temboo session
  GetUserConnections getUserConnectionsChoreo = new GetUserConnections(session);

  // Set credential
  getUserConnectionsChoreo.setCredential("bootcamp3");

  // Set inputs

  // Run the Choreo and store the results
  GetUserConnectionsResultSet getUserConnectionsResults = getUserConnectionsChoreo.run();
  


  XML xml = parseXML(getUserConnectionsResults.getResponse());

  //println(xml.getChildren());
  XML[] children = xml.getChildren("person");
 // println(children[1]);
 
  for (int i=0; i<children.length; i++) {
    //println(children[i]);
    XML child =children[i];
    XML firstname = child.getChild("first-name");
    String fn;
    if(firstname != null){
      fn = firstname.getContent();
    }
    else{
      fn = "no data";
    }
    
    XML lastname = child.getChild("last-name");
    String ln;
    if(lastname != null){
      ln = lastname.getContent();
    }
    else{
      ln = "no data";
    }    
    
    XML loca1 = child.getChild("location");
    String location;
    if (loca1 != null){
      XML loca2 = loca1.getChild("name");
      if(loca2 != null){
        location = loca2.getContent();
      }
      else{
        location = "no data";
      }
    }
    else{
      location = "no data";
    }
    
    XML indus = child.getChild("industry");
    String indus2;
    if (indus != null){
      indus2 = indus.getContent();
    }
    else{
      indus2 = "no data";
    }
    println(fn+","+ln+","+location+","+indus2);
  }
}





