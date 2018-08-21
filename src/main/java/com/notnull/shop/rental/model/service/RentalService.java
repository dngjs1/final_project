package com.notnull.shop.rental.model.service;

import java.util.List;

import com.notnull.shop.rental.model.vo.Rental;

public interface RentalService {
	
	public boolean insertRental(Rental rental);

	public int selectRentalCount();

	public List<Rental> RentalList(int cPage, int numPerPage);

	
}
