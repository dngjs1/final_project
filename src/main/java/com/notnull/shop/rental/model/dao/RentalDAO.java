package com.notnull.shop.rental.model.dao;

import java.util.List;

import com.notnull.shop.rental.model.vo.Rental;
import com.notnull.shop.rental.model.vo.RentalPerson;

public interface RentalDAO {

	boolean insertRental(Rental rental);

	int selectRentalCount();

	List<Rental> RentalList(int cPage, int numPerPage);

	Rental getRental(int rental_obj_code);

	int insertRentalPerson(RentalPerson rentalPerson);

	List<RentalPerson> selectRentalPerson(int rental_obj_code);

	List<Rental> RentalListAll();

}
