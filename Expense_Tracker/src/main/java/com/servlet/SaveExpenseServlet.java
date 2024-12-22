package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ExpenseDao;
import com.db.HibernateUtil;
import com.entity.Expense;
import com.entity.User;

@WebServlet("/saveExpense")
public class SaveExpenseServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String category = req.getParameter("category");
		String date = req.getParameter("date");
		String time = req.getParameter("time");
		String description = req.getParameter("description");
		String price = req.getParameter("price");
		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("loginUser");
		
		Expense ex = new Expense(category, date, time, description, price, user);
		
		ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());
		
		boolean f = dao.saveExpense(ex);
		
		if(f) {
			session.setAttribute("msg", "Expense Added Successfully");
			resp.sendRedirect("user/viewExpense.jsp");
		} else {
			session.setAttribute("msg", "Expense was not added to the server!!! Please Try agin.");
			resp.sendRedirect("user/viewExpense.jsp");
		}
		
	}
	
	

}
