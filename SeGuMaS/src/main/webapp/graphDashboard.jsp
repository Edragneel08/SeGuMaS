<%-- 
    Document   : graphDashboard
    Created on : 29 Jun 2024, 11:34:05 pm
    Author     : edrag
--%>

<%@ page import="java.util.List, java.util.ArrayList, java.util.HashMap, java.util.Map" %>
<%@ page import="DAO.SiteDAO" %>
<%@ page import="MODEL.site" %>

<%
    SiteDAO siteDAO = new SiteDAO();
    List<site> sites = siteDAO.selectAllSite();

    Map<String, Integer> activeSiteCountMap = new HashMap<>();

    for (site site : sites) {
        String siteName = site.getSiteName();
        String status = site.getStatus();

        if (status.equals("Active")) {
            activeSiteCountMap.put(siteName, activeSiteCountMap.getOrDefault(siteName, 0) + 1);
        }
    }

    ArrayList<String> siteNames = new ArrayList<>(activeSiteCountMap.keySet());
    ArrayList<Integer> activeCounts = new ArrayList<>(activeSiteCountMap.values());

    String siteNamesJson = new com.google.gson.Gson().toJson(siteNames);
    String activeCountsJson = new com.google.gson.Gson().toJson(activeCounts);
%>
