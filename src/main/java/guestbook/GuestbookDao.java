package guestbook;

import java.util.List;

public interface GuestbookDao {

	public List<GuestbookVo> getList();

	public int insert(GuestbookVo vo);

	public int delete(GuestbookVo vo);

}
