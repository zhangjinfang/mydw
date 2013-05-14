package data.web.model;

import java.io.IOException;
import java.util.Iterator;
import javax.xml.soap.SOAPConnectionFactory;
import javax.xml.soap.*;
import javax.xml.transform.*;
import javax.xml.transform.stream.StreamResult;
public class PreComputation {
	
	private String result=null;
	public String getResult(){
		return this.result;
	}
		public PreComputation(String schemaname, String cubename,String olaptype,String algorithm) {
			try {
				// First create the connection
				SOAPConnectionFactory soapConnFactory = SOAPConnectionFactory
						.newInstance();
				SOAPConnection connection = soapConnFactory.createConnection();

				// Next, create the actual message
				MessageFactory messageFactory = MessageFactory.newInstance();
				SOAPMessage message = messageFactory.createMessage();

				// Create objects for the message parts
				SOAPPart soapPart = message.getSOAPPart();
				SOAPEnvelope envelope = soapPart.getEnvelope();
				SOAPBody body = envelope.getBody();

				// Populate the body
				// Create the main element and namespace
				SOAPElement bodyElement = body.addChildElement(envelope.createName(
						"preCompute", "x1", "scut.south.c4.230.lcx"));
				// Add content

				Name schema = envelope.createName("schemaname", "x2",
						"scut.south.c4.230.lcl");
				SOAPElement eRequestType1 = bodyElement.addChildElement(schema);
				eRequestType1.addTextNode(schemaname);

				Name nPara = envelope.createName("cubename", "x3",
						"scut.south.c4.230.czp");
				SOAPElement eRequestType2 = bodyElement.addChildElement(nPara);
				eRequestType2.addTextNode(cubename);
				// bodyElement.addTextNode("37");
				
				Name olap = envelope.createName("olaptype", "x4",
				"scut.south.c4.230.wf");
		        SOAPElement eRequestType3 = bodyElement.addChildElement(olap);
		        eRequestType3.addTextNode(olaptype);

		        Name alg = envelope.createName("algorithm", "x5",
				"scut.south.c4.230.wz");
		        SOAPElement eRequestType4 = bodyElement.addChildElement(alg);
		        eRequestType4.addTextNode(algorithm);

				// Save the message
				message.saveChanges();

				// Check the input
				message.writeTo(System.out);

				// Send the message and get a reply

				// Set the destination
				String destination = "http://localhost:81";
				// Send the message
				
				SOAPMessage reply = connection.call(message, destination);

				SOAPBody soapbody=reply.getSOAPPart().getEnvelope().getBody();
				
				Name name=reply.getSOAPPart().getEnvelope().createName("preComputeResponse","","http://localhost/preCompute/");
				SOAPElement eResponse= selectSingleNode(soapbody, name);
				System.out.println(eResponse);
				
				Name nReturn = envelope.createName("return", "", "http://localhost/preCompute/");
				SOAPElement eReturn=selectSingleNode(eResponse,nReturn);
				System.out.println(eReturn);
				
				Name nRoot = envelope.createName("root", "", "http://localhost/preCompute/");
				SOAPElement eRoot=selectSingleNode(eReturn,nRoot);
				System.out.println(eRoot);
				
				Name nPreCmptRetFlag=envelope.createName("PreCmptRetFlag", "", "http://localhost/preCompute/");
				SOAPElement ePreCmptRetFlag=selectSingleNode(eRoot,nPreCmptRetFlag);
				System.out.println(ePreCmptRetFlag);
				
				result=ePreCmptRetFlag.getValue();
				// Close the connection
				connection.close();

			} catch (SOAPException e) {			
				System.out.println(e.getMessage());
			} catch (IOException e){			
				System.out.println(e.getMessage());
			}
		}

		private SOAPElement selectSingleNode(SOAPElement contextNode,
                Name childName) {

			Iterator it = contextNode.getChildElements(childName);
			if (it.hasNext())
				return (SOAPElement) it.next();
			else
				return null;
}
		public static void main(String[] args) {
			new PreComputation("Foodmart", "Sales","MOLAP","MolapQCPrecomputation");

		}

}
