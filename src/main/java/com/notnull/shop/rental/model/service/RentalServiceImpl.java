package com.notnull.shop.rental.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.notnull.shop.rental.model.dao.RentalDAO;
import com.notnull.shop.rental.model.vo.Rental;
import com.notnull.shop.rental.model.vo.RentalPerson;

@Service
public class RentalServiceImpl implements RentalService{

	@Autowired
	RentalDAO dao;

	@Override
	public boolean insertRental(Rental rental) {
		return dao.insertRental(rental);
	}

	@Override
	public int selectRentalCount() {
		return dao.selectRentalCount();
	}

	@Override
	public List<Rental> RentalList(int cPage, int numPerPage) {
		return dao.RentalList(cPage, numPerPage);
	}

	@Override
	public Rental getRental(int rental_obj_code) {
		return dao.getRental(rental_obj_code);
	}

	@Override
	public int insertRentalPerson(RentalPerson rentalPerson) {
		return dao.insertRentalPerson(rentalPerson);
		
	}

	@Override
	public List<RentalPerson> selectRentalPerson(int rental_obj_code) {
		return dao.selectRentalPerson(rental_obj_code);
	}


}
