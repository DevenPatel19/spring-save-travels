package com.codingdojo.springsavetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.springsavetravels.models.Expense;
import com.codingdojo.springsavetravels.repositories.ExpenseRepository;

@Service
public class ExpenseService {

		private final ExpenseRepository expenseRepo;
		
		public ExpenseService(ExpenseRepository expenseRepo) {
			this.expenseRepo = expenseRepo;
		}
		
		// read all
		public List<Expense> allExpenses() {
			return expenseRepo.findAll();
		}
		
		// create one
		public Expense createExpense(Expense newExpense) {
			return expenseRepo.save(newExpense);
		}
		
		//read one
		public Expense findExpense(Long id) {
			Optional<Expense> optionalExpense = expenseRepo.findById(id);
			if(optionalExpense.isPresent()) {
				return optionalExpense.get();
			} else {
				return null;
			}
		}
		
		// update one
		public Expense updateExpense(Expense updatedExpense) {
			return expenseRepo.save(updatedExpense);
		}
		
		// delete one
		public void deleteExpenseById(Long id) {
			expenseRepo.deleteById(id);
		}
}
