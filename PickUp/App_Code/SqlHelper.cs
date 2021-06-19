using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
/// <summary>
/// 
/// </summary>
public class SqlHleper
{
	public static SqlConnection getOpenConnection()
	{
		string connstr = WebConfigurationManager.ConnectionStrings["connstr"].ConnectionString;
		SqlConnection conn = new SqlConnection(connstr);
		try
		{
			//打开数据库连接
			conn.Open();
			return conn;

		}
		catch (Exception ex)
		{
			return null;//有异常返回null
		}
	}

	/// <summary>
	/// 用来执行非查询命令的方法
	/// </summary>
	/// <param name="comm">是一个已经指定CommandText的SqlCommand类对象
	/// 并且已经给sql命令的每一个@开头的变量一一赋值
	/// </param>
	/// <returns></returns>
	public static int changeData(SqlCommand comm)
	{
		SqlConnection conn = getOpenConnection();
		if (conn != null)
		{
			comm.Connection = conn;
            try
            {
			return comm.ExecuteNonQuery();

            }
            catch(Exception ex)
            {
				return -1;//执行命令有异常
            }
            finally
            {
				conn.Close();
            }

		}
		else
		{
			return -1;//打开连接有异常
		}
	}
	public static int changeData(string sql)
	{
		SqlConnection conn = getOpenConnection();
		if (conn != null)
		{
			SqlCommand comm = new SqlCommand();
			comm.CommandText = sql;//从web窗体传递过来的无变量的select语句
			comm.Connection = conn;
			try
			{
				return comm.ExecuteNonQuery();

			}
			catch (Exception ex)
			{
				return -1;//执行命令有异常
			}
			finally
			{
				conn.Close();
			}

		}
		else
		{
			return -1;//打开连接有异常
		}
	}


	/// <summary>
	/// 执行返回单个值的查询命令，却命令中有@开头的变量
	/// </summary>
	/// <param name="comm">SqlCommand comm</param>是一个已经指定CommandText的SqlCommand类对象
	/// 并且已经给sql命令的每一个@开头的变量一一赋值
	/// <returns></returns>
	public static object queryOneValue(SqlCommand comm)
    {
		SqlConnection conn = getOpenConnection();
		if (conn != null)
		{
			comm.Connection = conn;
			try
			{
				return comm.ExecuteScalar();

			}
			catch (Exception ex)
			{
				return -1;//执行命令有异常
			}
			finally
			{
				conn.Close();
			}

		}
		else
		{
			return -1;//打开连接有异常
		}

	}

	/// <summary>
	/// 执行返回单个值的查询命令，且命令中没有有@开头的变量
	/// </summary>
	/// <param name="comm">SqlCommand comm</param>是一个已经指定CommandText的SqlCommand类对象
	/// 并且已经给sql命令的每一个@开头的变量一一赋值
	/// <returns></returns>
	public static object queryOneValue(string select)
	{
		SqlConnection conn = getOpenConnection();
		if (conn != null)
		{
			SqlCommand comm = new SqlCommand();
			comm.CommandText = select;//从web窗体传递过来的无变量的select语句
			comm.Connection = conn;
			try
			{
				return comm.ExecuteScalar();

			}
			catch (Exception ex)
			{
				return -1;//执行命令有异常
			}
			finally
			{
				conn.Close();
			}

		}
		else
		{
			return -1;//打开连接有异常
		}
	}

	/// <summary>
	/// 执行返回多行多列数据的查询命令，查询结果不需要随机访问或分页显示
	/// </summary>
	/// <param name="comm"></param>
	/// <returns></returns>
	public static SqlDataReader queryDataReader(SqlCommand comm) {
		SqlConnection conn = getOpenConnection();
		if (conn != null)
		{
			
			comm.Connection = conn;
			try
			{
				return comm.ExecuteReader(CommandBehavior.CloseConnection);

			}
			catch (Exception ex)
			{
				return null;//执行命令有异常
			}
			//finally
			//{
			//	conn.Close();
			//}

		}
		else
		{
			return null;//打开连接有异常
		}

	}
	/// <summary>
	/// 执行返回多行多列数据的查询命令，查询结果需要随机访问或分页显示
	/// </summary>
	/// <param name="comm"></param>
	/// <returns></returns>
	public static DataSet queryDataSet(SqlCommand comm)
	{
		SqlConnection conn = getOpenConnection();
		if (conn != null)
		{

			comm.Connection = conn;
			try
			{
				SqlDataAdapter sda = new SqlDataAdapter(comm);
				DataSet ds = new DataSet();
				sda.Fill(ds);//z执行查询命令，并将查询结果保存到dataset对象ds中
				return ds;
			}
			catch (Exception ex)
			{
				return null;//执行命令有异常
			}
			finally
			{
				conn.Close();
			}

		}
		else
		{
			return null;//打开连接有异常
		}

	}
	//方法重载：
	/// <summary>
	/// 执行返回多行多列数据的查询命令，查询结果不需要随机访问或分页显示
	/// </summary>
	/// <param name="select">一条没有@开头的变量的select语句</param>
	/// <returns></returns>
	public static SqlDataReader queryDataReader(string select)
	{
		SqlConnection conn = getOpenConnection();
		if (conn != null)
		{
			SqlCommand comm = new SqlCommand();
			comm.CommandText = select;
			comm.Connection = conn;
			try
			{
				return comm.ExecuteReader(CommandBehavior.CloseConnection);

			}
			catch (Exception ex)
			{
				return null;//执行命令有异常
			}
			//finally
			//{
			//	conn.Close();
			//}

		}
		else
		{
			return null;//打开连接有异常
		}

	}
	/// <summary>
	/// 执行返回多行多列数据的查询命令，查询结果需要随机访问或分页显示
	/// </summary>
	/// <param name="select">一条没有@开头的变量的select语句</param>
	/// <returns></returns>
	public static DataSet queryDataSet(string select)
	{
		SqlConnection conn = getOpenConnection();
		if (conn != null)
		{
			SqlCommand comm = new SqlCommand();
			comm.CommandText = select;
			comm.Connection = conn;
			try
			{
				SqlDataAdapter sda = new SqlDataAdapter(comm);
				DataSet ds = new DataSet();
				sda.Fill(ds);//z执行查询命令，并将查询结果保存到dataset对象ds中
				return ds;
			}
			catch (Exception ex)
			{
				return null;//执行命令有异常
			}
			finally
			{
				conn.Close();
			}

		}
		else
		{
			return null;//打开连接有异常
		}

	}

}