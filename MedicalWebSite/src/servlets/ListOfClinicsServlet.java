package servlets;

import DAO.BuildingDAO;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import some_usefull_classes.Logger;
import utills.FreeMarker;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

@WebServlet("/listOfClinics")
public class ListOfClinicsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Logger.green_write("Get method from ListOfClinicsServlet servlet is called");

        ServletContext servletContext = getServletContext();
        Configuration cfg = new FreeMarker().getCfg(servletContext);

        cfg.setServletContextForTemplateLoading(servletContext,"/WEB-INF/templates");

        Map root = new HashMap();

        BuildingDAO buildingDAO = new BuildingDAO();
        List buildings = buildingDAO.getAll();

        root.put("buildings", buildings);

        Template t = cfg.getTemplate("listOfClinics.ftlh");
        try {
            t.process(root, resp.getWriter());
        } catch (TemplateException e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Logger.green_write("Post method from ListOfClinicsServlet servlet is called");

    }
}
