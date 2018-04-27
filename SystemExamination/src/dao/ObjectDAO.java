package dao;

public interface ObjectDAO {
	public boolean add(Object obj);
	public boolean edit(String id,Object obj);
	public boolean del(String id);
}
