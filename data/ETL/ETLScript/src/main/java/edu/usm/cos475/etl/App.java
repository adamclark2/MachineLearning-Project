package edu.usm.cos475.etl;

import java.io.*;
import java.util.*;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;

/**
 * Hello world!
 * Not my finest work, but it gets the file
 */
public class App 
{
    public static void main( String[] args ) throws Exception
    {
        File file = new File(args[0]);
        PDDocument document = PDDocument.load(file);

        PDFTextStripper pdfStripper = new PDFTextStripper();
        String text = pdfStripper.getText(document);
        document.close();

        // Debug stuff... ignore it
        Map<String, Long> deptCount = new HashMap<>();

        Scanner sc = new Scanner(text);
        System.out.println("CMP,Formatted_Name,Dept ID,Title,Salbase,JobSt,Bargaining Unit,Faculty Appt,FTE");
        while(sc.hasNextLine()){
            try{
                boolean isBadRecord = false;
                String ln = sc.nextLine();
                Scanner lnSc = new Scanner(ln);


                if(ln.equals("CMP Formatted_Name Dept ID Title Salbase JobSt Bargaining Unit Faculty Appt FTE")
                    || ln.equals("CMP Name Dept ID Title Salary Jobst Bargaining Unit Faculty Appt FTE")
                ){
                    isBadRecord = true;
                }
                
                String nex = lnSc.next();
                if(isCMP(nex) && !isBadRecord){
                    String system = nex;

                    String name = "";
                    try{
                        nex = lnSc.next();
                    }catch(Exception e){
                        nex = "";
                        isBadRecord = true;
                    }
                    
                    while(!isDept(nex) && !isBadRecord){
                        name += nex + " ";
                        if(!lnSc.hasNext()){
                            isBadRecord = true;
                        }else{
                            nex = lnSc.next();
                        }
                    }
                    String dept = nex;


                    if(!isBadRecord){
                        String title = "" ;
                        String salary = "";

                        nex = lnSc.next();
                        while(!isNumber(nex) && !isBadRecord){
                            title += nex + " ";
                            if(!lnSc.hasNext()){
                                isBadRecord = true;
                            }else{
                                nex = lnSc.next();
                            }
                        }

                        // Some programs can't parse double
                        // with the thousands seperator ...
                        salary = nex.replace(",", "");

                        if(!lnSc.hasNext()){
                            isBadRecord = true;
                        }

                        nex = lnSc.next();
                        String jobStatus = nex;

                        nex = lnSc.next();
                        String barginUnit = "";
                        while(!isFacultyAppt(nex) && !isNumber(nex) && !isBadRecord){
                            barginUnit += nex + " ";
                            if(!lnSc.hasNext()){
                                isBadRecord = true;
                            }else{
                                nex = lnSc.next();
                            }
                        }

                        String FacultyAppt = "";
                        String FTE = "";

                        if(isNumber(nex)){
                            FTE = nex;
                        }else{
                            FacultyAppt = nex;
                            nex = lnSc.next();
                            FTE = nex;
                        }

                        System.out.println("\"" + system + "\",\"" + name + "\",\"" + dept + "\",\"" + title + "\",\"" + salary + "\",\"" + jobStatus + "\",\"" + barginUnit + "\",\"" + FacultyAppt + "\",\"" + FTE + "\"");

                        if(!deptCount.containsKey(dept)){
                            deptCount.put(dept, 0L);
                        }
                        deptCount.put(dept, deptCount.get(dept) + 1);
                    }
        
                }
            }catch(Exception e){
                // Bad record ... continue
            }
        }

        // Debug
        for(String key : deptCount.keySet()){
            if(key.length() < 5){
                //System.out.println("Dept: " + key + " i:" + deptCount.get(key));
            }
        }

    }

    /// Is the string a CMP
    /// Ex USM, UM, SWS
    private static boolean isCMP(String nex){
        return nex.length() >= 2 && nex.length() <= 4 && !nex.toLowerCase().equals("the") && !nex.toLowerCase().equals("it") && nex.toUpperCase().equals(nex);
    }

    private static boolean isNumber(String nex){
        nex = nex.replace(",", "");
        try{
            Double.parseDouble(nex);
            return true;
        }catch(Exception e){
            return false;
        }
    }

    private static boolean isDept(String nex){
        return nex.toUpperCase().equals(nex) && !nex.contains(".") && nex.length() > 1 && !nex.toLowerCase().contains(",");
    }

    private static boolean isFacultyAppt(String nex){
        return nex.toLowerCase().equals("federal") || nex.toLowerCase().equals("ay") || nex.toLowerCase().equals("fy");
    }


}
