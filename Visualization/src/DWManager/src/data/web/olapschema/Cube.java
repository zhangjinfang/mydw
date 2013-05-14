package data.web.olapschema;

import java.util.ArrayList;
import org.jdom.Document;
import org.jdom.*;
import org.jdom.input.*;

public class Cube {

	public Cube(){

	}

	public Cube(Element cubeElement){
            cubeName=cubeElement.getAttributeValue("name");

            Element tableElement=cubeElement.getChild("Table");
            tableName=tableElement.getAttributeValue("name");

            //add DimensionUsage
            ArrayList<Element> duList=new ArrayList<Element>(cubeElement.getChildren("DimensionUsage"));
            for(int i=0;i<duList.size();i++){
                DimensionUsage du=new DimensionUsage(duList.get(i));
                dimensionUaList.add(du);
            }

            //add Dimension
            ArrayList<Element> dimList=new ArrayList<Element>(cubeElement.getChildren("Dimension"));
            for(int i=0;i<dimList.size();i++){
                Dimension dim=new Dimension(dimList.get(i));
                dimensionList.add(dim);
            }

            //add Measure
            ArrayList<Element> measureList=new ArrayList<Element>(cubeElement.getChildren("Measure"));
            for(int i=0;i<measureList.size();i++){
                Measure measure=new Measure(measureList.get(i));
                mList.add(measure);
            }

            ArrayList<Element> calMemList=new ArrayList<Element>(cubeElement.getChildren("CalculatedMember"));
            for(int i=0;i<calMemList.size();i++){
                CalculatedMember ccm=new CalculatedMember(calMemList.get(i));
                calcMemberList.add(ccm);
            }
	}

	private String cubeName=new String();
	private ArrayList<Measure> mList = new ArrayList<Measure>();
	private ArrayList<Dimension> dimensionList = new ArrayList<Dimension>();
	private ArrayList<DimensionUsage> dimensionUaList = new ArrayList<DimensionUsage>();
	private ArrayList<CalculatedMember> calcMemberList = new ArrayList<CalculatedMember>();
	private String tableName = new String();

	public ArrayList<Measure> getMList() {
		return mList;
	}

	public void setMList(ArrayList<Measure> list) {
		mList = list;
	}

	public ArrayList<Dimension> getDimensionList() {
		return dimensionList;
	}

	public void setDimensionList(ArrayList<Dimension> dimensionList) {
		this.dimensionList = dimensionList;
	}

	public ArrayList<DimensionUsage> getDimensionUaList() {
		return dimensionUaList;
	}

	public void setDimensionUaList(ArrayList<DimensionUsage> dimensionUaList) {
		this.dimensionUaList = dimensionUaList;
	}

	public ArrayList<CalculatedMember> getCalcMemberList() {
		return calcMemberList;
	}

	public void setCalcMemberList(ArrayList<CalculatedMember> calcMemberList) {
		this.calcMemberList = calcMemberList;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getCubeName() {
		return cubeName;
	}

	public void setCubeName(String cubeName) {
		this.cubeName = cubeName;
	}

	public String toXML(){
		String buf="<Cube name=\""+cubeName+"\">\n";
		buf=buf+"<Table name=\""+tableName+"\"/>\n";

		for(int i=0;i<dimensionUaList.size();i++){
			buf=buf+dimensionUaList.get(i).toXML();
		}

		for(int i=0;i<dimensionList.size();i++){
			buf=buf+dimensionList.get(i).toXML();
		}

		for(int i=0;i<mList.size();i++){
			buf=buf+mList.get(i).toXML();
		}

		for(int i=0;i<calcMemberList.size();i++){
			buf=buf+calcMemberList.get(i).toXML();
		}

		buf=buf+"</Cube>\n";
		return buf;
	}
	
	public String getInitMDX(){
		String mdx="select ";
		
		if(getMList().size()>0){
			String measureName=getMList().get(0).getName();
			
			mdx=mdx+"{[Measures].["+measureName+"]} on columns ";
		}
		
		//—∞’“”–hasAll=trueµƒŒ¨∂»
		for(int i=0;i<this.getDimensionList().size();i++){
			
			Dimension dim=getDimensionList().get(i);
			
			String dimName=dim.getDimName();
			
			if(dim.getHieList().size()>0){
				
				Hierarchy hie=dim.getHieList().get(0);
				
				String allMemName;
				
				if(hie.isHasAll().equals(new Boolean(true))){
					if(hie.getAllMemberName()==null)
						allMemName="All"+dimName+"s";
					else
						allMemName=hie.getAllMemberName();
					
					mdx=mdx+",{["+dimName+"].["+allMemName+"]} ON rows ";
					
					break;
				}
			}
		}
		
		mdx=mdx+"FROM "+getCubeName();
		
		return mdx;
	}
}
