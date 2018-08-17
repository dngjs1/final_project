package com.notnull.shop.rental.model.service;

import java.util.List;

import com.notnull.shop.rental.model.vo.Rental;

public interface RentalService {
	
	public List<Rental> getRenList(int pageNum);
	
}
