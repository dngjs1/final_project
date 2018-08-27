package com.notnull.shop.rental.model.service;

import java.util.List;
import java.util.Map;

import com.notnull.shop.rental.model.vo.Rental;
import com.notnull.shop.rental.model.vo.RentalPerson;

public interface RentalService {
	
	public boolean insertRental(Rental rental);

	public int selectRentalCount();

	public List<Rental> RentalList(int cPage, int numPerPage);

	public Rental getRental(int rental_obj_code);

	public int insertRentalPerson(RentalPerson rentalPerson);

	public List<RentalPerson> selectRentalPerson(int rental_obj_code);

	public List<Rental> RentalListAll();

	public List<Rental> RentalListSearch(int cPage, int numPerPage, String[] rentalSearch);

	public int selectRentalSearchCount(String[] rentalSearch);

	public List<Map> selectOrderList(String member_id, int cPage, int numPerPage);

	public int orderListCount(String member_id);

	public List<Map> selectOrderList2(String member_id, int cPage, int numPerPage);

	public int orderListCount2(String member_id);

	public List<Map> selectOrderList3(String member_id, int cPage, int numPerPage);

	public int orderListCount3(String member_id);

}
