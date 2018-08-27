package com.notnull.shop.rental.model.dao;

import java.util.List;
import java.util.Map;

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

	List<Rental> RentalListSearch(int cPage, int numPerPage, String[] rentalSearch);

	int selectRentalSearchCount(String[] rentalSearch);

	List<Map> selectOrderList(String member_id, int cPage, int numPerPage);

	int orderListCount(String member_id);

	List<Map> selectOrderList2(String member_id, int cPage, int numPerPage);

	int orderListCount2(String member_id);

	List<Map> selectOrderList3(String member_id, int cPage, int numPerPage);

	int orderListCount3(String member_id);

}
