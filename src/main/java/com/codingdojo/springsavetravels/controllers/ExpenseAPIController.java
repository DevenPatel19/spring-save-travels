package com.codingdojo.springsavetravels.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.codingdojo.springsavetravels.models.Expense;
import com.codingdojo.springsavetravels.services.ExpenseService;

@RestController
@RequestMapping("/api")
public class ExpenseAPIController {
	
	@Autowired
	private ExpenseService expenseService;
	
//	private final ExpenseService expenseService;
//	
//	public ExpenseAPIController(ExpenseService expenseService) {
//		this.expenseService = expenseService;
//	}
	
	// Read all Expenses 
	@GetMapping("/expenses")
	public List<Expense> getAllExpenses() {
		return expenseService.allExpenses();
	}
	
	// Create an expense
	@PostMapping("/expenses/new")
	public Expense createExpense(@ModelAttribute("newExpense") Expense newExpense
			) {
		return expenseService.createExpense(newExpense);
		}
		
		
	// find one expense by ID
	@GetMapping("/expenses/{id}")
	public Expense findExpenseById(
			// 1. get by id
			@PathVariable("id")Long id) {
		return expenseService.findExpense(id);
	}
	
	// edit/update one -- find that expense by ID, update all info with the form data
	@PutMapping("/expenses/{id}")
	public Expense updateExpenseById(
			// 1. get by id
			@PathVariable("id") Long id,
			// 2. Data binding
			@ModelAttribute("expense") Expense expense
			) {
		return expenseService.updateExpense(expense);
	}
	
	// delete one
	@DeleteMapping("/expenses/{id}")
	public void deleteExpenseById(
			// 1. get by id
			@PathVariable("id")Long id) {
	expenseService.deleteExpenseById(id);
	}
}

