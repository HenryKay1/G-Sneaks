<%@page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@page language="java" import="dbUtils.*" %>
<%@page language="java" import="model.sneakers.*" %> 
<%@page language="java" import="view.sneakersView" %> 
<%@page language="java" import="com.google.gson.*" %>

<%
    StringData sd = new StringData();
    String searchId = request.getParameter("sneakerId");
    if (searchId == null) {
        sd.errorMsg = "Cannot search for sneaker - 'sneakerId' most be supplied";
    } else {
        DbConn dbc = new DbConn();
        sd.errorMsg = dbc.getErr(); 
        if (sd.errorMsg.length() == 0) { 
            System.out.println("*** Ready to call allUsersAPI");
            sd = DbMods.findSneakerById(dbc, searchId);  
        }
        dbc.close(); 
    }
    Gson gson = new Gson();
    out.print(gson.toJson(sd).trim());
%>