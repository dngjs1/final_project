package com.notnull.shop.rental.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.notnull.shop.rental.model.vo.Rental;
import com.notnull.shop.rental.model.vo.RentalPerson;

@Repository
public class RentalDAOImpl implements RentalDAO {
	
	private final String ra = "Rental.";

	@Autowired
	SqlSession sqlSession;

	@Override
	public boolean insertRental(Rental rental) {
		return sqlSession.insert(ra+"insertRental", rental) > 0 ? true : false;
	}

	@Override
	public int selectRentalCount() {
		return sqlSession.selectOne(ra+"selectRentalCount");
	}

	@Override
	public List<Rental> RentalList(int cPage, int numPerPage) {
		
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		
		return sqlSession.selectList(ra+"rentalList", null, rb);
	}

	@Override
	public Rental getRental(int rental_obj_code) {
		return sqlSession.selectOne(ra+"getRental", rental_obj_code);
	}

	@Override
	public int insertRentalPerson(RentalPerson rentalPerson) {
		return sqlSession.insert(ra+"insertRentalPerson", rentalPerson);
	}

	@Override
	public List<RentalPerson> selectRentalPerson(int rental_obj_code) {
		return sqlSession.selectList(ra+"selectRentalPerson", rental_obj_code);
	}

	@Override
	public List<Rental> RentalListAll() {
		return sqlSession.selectList(ra+"rentalList");
	}


	@Override
	public List<Rental> RentalListSearch(int cPage, int numPerPage, String[] rentalSearch) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList(ra+"rentalListSearch", rentalSearch, rb);
	}

	@Override
	public int selectRentalSearchCount(String[] rentalSearch) {
		return sqlSession.selectOne(ra+"selectRentalSearchCount", rentalSearch);
	}

	@Override
	public List<Map> selectOrderList(String member_id, int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList(ra+"selectOrderList",member_id,rb);
	}

	@Override
	public int orderListCount(String member_id) {
		return sqlSession.selectOne(ra+"orderListCount",member_id);
	}

	@Override
	public List<Map> selectOrderList2(String member_id, int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList(ra+"selectOrderList2",member_id,rb);
	}

	@Override
	public int orderListCount2(String member_id) {
		return sqlSession.selectOne(ra+"orderListCount2",member_id);
	}

	@Override
	public List<Map> selectOrderList3(String member_id, int cPage, int numPerPage){
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList(ra+"selectOrderList3",member_id,rb);
	}

	@Override
	public int orderListCount3(String member_id) {
		return sqlSession.selectOne(ra+"orderListCount3",member_id);
	}


}
