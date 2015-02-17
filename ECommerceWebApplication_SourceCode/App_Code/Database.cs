using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Database
/// </summary>
public class Database
{
    SqlConnection _con = null;
	public Database()
	{
        _con = new SqlConnection(@"Initial Catalog=Ecommerce;Data Source=sudeep-lt\sqlexpress;Integrated Security=SSPI;");
	}

    public DataTable ExecuteQuery(string queryString)
    {
        SqlConnection sqlConnection1 = _con;
        SqlCommand cmd = new SqlCommand();
        DataTable table = new DataTable();
           
        cmd.CommandText = queryString;
        cmd.CommandType = CommandType.Text;
        cmd.Connection = sqlConnection1;

        sqlConnection1.Open();

        using (SqlDataReader reader = cmd.ExecuteReader())
        {
            table.Load(reader);

        }
        // Data is accessible through the DataReader object here.

        sqlConnection1.Close();
        return table;
    }

    public DataTable ExecuteStoredProc(string procName,Dictionary<string,string> parameters)
    {
        SqlConnection sqlConnection1 = _con;
        SqlCommand cmd = new SqlCommand();
        DataTable table = new DataTable();

        cmd.CommandText = procName;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = sqlConnection1;

        foreach (string key in parameters.Keys)
        {
            if(!string.IsNullOrEmpty(parameters[key]))
                cmd.Parameters.AddWithValue(key, parameters[key]);
        }

        sqlConnection1.Open();

        using (SqlDataReader reader = cmd.ExecuteReader())
        {
            table.Load(reader);

        }
    

        sqlConnection1.Close();
        return table;
    }
}