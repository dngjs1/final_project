package com.notnull.shop.rental.model.dao;

import java.util.List;

import com.notnull.shop.rental.model.vo.Rental;

public interface RentalDAO {

	boolean insertRental(Rental rental);

	int selectRentalCount();

	List<Rental> RentalList(int cPage, int numPerPage);

	Rental getRental(int rental_obj_code);

}
