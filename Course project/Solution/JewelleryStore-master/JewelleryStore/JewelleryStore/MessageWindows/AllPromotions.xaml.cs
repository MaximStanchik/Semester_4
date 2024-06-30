using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace JewelleryStore.MessageWindows
{
    /// <summary>
    /// Логика взаимодействия для AllPromotions.xaml
    /// </summary>
    public partial class AllPromotions : Window
    {
        public string DiscountBurgerResult { get; set; }
        public string DiscountShawermaResult { get; set; }
        public string DiscountSaladsResult { get; set; }
        public string DiscountDrinksResult { get; set; }
        public AllPromotions()
        {
            InitializeComponent();
            ExecuteSqlQuery();
            DataContext = this;
        }
        private void ButtonOK_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
        private void ExecuteSqlQuery()
        {
            string connectionString = "Server=localhost,1433;Database=AppDB;User Id=sa;Password=aaaa_1111;Trusted_Connection=False;MultipleActiveResultSets=true;TrustServerCertificate=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string sqlQuery = "SELECT ISNULL(DiscountAmount, 0) AS Discount FROM DISCOUNTSONGOODS WHERE IsBurgersDiscounted = 1";

                using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            double discount = reader.GetDouble(0) * 100;
                            DiscountBurgerResult = discount.ToString();
                        }
                        else
                        {
                            DiscountBurgerResult = "0";
                        }
                    }
                }
            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string sqlQuery = "SELECT ISNULL(DiscountAmount, 0) AS Discount FROM DISCOUNTSONGOODS WHERE IsShawarmasDiscounted = 2";

                using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            double discount = reader.GetDouble(0) * 100;
                            DiscountShawermaResult = discount.ToString();
                        }
                        else
                        {
                            DiscountShawermaResult = "0";
                        }
                    }
                }
            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string sqlQuery = "SELECT ISNULL(DiscountAmount, 0) AS Discount FROM DISCOUNTSONGOODS WHERE IsSaladsDiscounted = 3";

                using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            double discount = reader.GetDouble(0) * 100;
                            DiscountSaladsResult = discount.ToString();
                        }
                        else
                        {
                            DiscountSaladsResult = "0";
                        }
                    }
                }
            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string sqlQuery = "SELECT ISNULL(DiscountAmount, 0) AS Discount FROM DISCOUNTSONGOODS WHERE IsDrinksDiscounted = 4";

                using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            double discount = reader.GetDouble(0) * 100;
                            DiscountDrinksResult = discount.ToString();
                        }
                        else
                        {
                            DiscountDrinksResult = "0";
                        }
                    }
                }
            }
        }
    }
}
