package com.codingdojo.springsavetravels.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.springsavetravels.models.Expense;
import com.codingdojo.springsavetravels.services.ExpenseService;

import jakarta.validation.Valid;

@Controller
public class ExpenseController {
	@Autowired
	private ExpenseService expenseService;
	
	
//	Dash Board
	@GetMapping("/expenses")
	public String expenseDashboard(Model model) {
		// 1. get the list of expenses from the expenseService
		List<Expense> expenseList = expenseService.allExpenses();
				
		// 2. send the data to jsp
		model.addAttribute("expenseList",expenseList);
		return "main.jsp";
	}
//	Read one by id
	@GetMapping("/expenses/{id}")
	public String expenseDetailsPage(
			@PathVariable("id")Long id, Model model
			) {
		// 1. make use of the id from path, get expense info from service
		Expense oneExpense = expenseService.findExpense(id);
		// 2. send data to jsp
		model.addAttribute("oneExpense", oneExpense);
		return "expenseDetails.jsp";
		}
//	Create New
	@GetMapping("expenses/new")
	public String renderCreateForm(Model model) {
		model.addAttribute("newExpense", new Expense());
		return "main.jsp";
	}
	
	@PostMapping("expenses/new")
	public String processCreate(@Valid @ModelAttribute("newExpense") Expense newExpense, BindingResult result
			) {
		if(result.hasErrors()) {
			return "main.jsp";
		} else {
			expenseService.createExpense(newExpense);
			return "redirect:/";
		}
		
	}
	
	// Render edit form
	@GetMapping("/expenses/{id}/edit")
	public String renderEditForm(@PathVariable("id")Long id, Model model) {
//		get expense info by id
		Expense expense = expenseService.findExpense(id);
		model.addAttribute("expense", expense);
//		store it in model attribute/send to jsp
		return "expenseEdit.jsp";
	}
//	edit by id
	@PutMapping("/expenses/{id}/edit")
	public String processEditForm(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
		if (result.hasErrors()) {
	        return "expenseEdit.jsp";
	    } else {
	        expenseService.createExpense(expense);
	        return "redirect:/";
	    }
	}
//	Delete by id
	@DeleteMapping("/expenses/{id}")
	public String processDelete(@PathVariable("id")Long id) {
		expenseService.deleteExpenseById(id);
		return "redirect:/";
	}	
	
	@GetMapping("/")
	public String mainWithDashboarbAndForm(Model model) {
		model.addAttribute("expenseList", expenseService.allExpenses());
		model.addAttribute("newExpense", new Expense());
		return "main.jsp";
	}
	
	@PostMapping("/")
	public String ProcessCreateInMain(
			@Valid @ModelAttribute("newExpense") Expense newExpense, BindingResult result
			) {
		if (result.hasErrors()) {
			return "main.jsp";
		}else {
			return "redirect:/";
		}
		
	}
}

