package com.notnull.shop.rental.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.notnull.shop.rental.model.dao.RentalDAO;
import com.notnull.shop.rental.model.vo.Rental;

@Service
public class RentalServiceImpl implements RentalService{

	@Autowired
	RentalDAO dao;

	@Override
	public boolean insertRental(Rental rental) {
		return dao.insertRental(rental);
	}
}
