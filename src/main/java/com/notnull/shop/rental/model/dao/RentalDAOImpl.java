package com.notnull.shop.rental.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.notnull.shop.rental.model.vo.Rental;

@Repository
public class RentalDAOImpl implements RentalDAO {
	
	private final String ra = "Rental.";

	@Autowired
	SqlSession sqlSession;

	@Override
	public boolean insertRental(Rental rental) {
		return sqlSession.insert(ra+"insertRental"+rental) > 0 ? true : false;
	}
	
	
}
