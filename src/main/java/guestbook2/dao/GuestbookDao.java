package guestbook2.dao;

import java.util.List;

import guestbook2.vo.GuestbookVo;

public interface GuestbookDao {

	public List<GuestbookVo> getList();

	public int insert(GuestbookVo vo);

	public int delete(GuestbookVo vo);

}
