using JewelleryStore.MessageWindows;
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
using System.Windows.Navigation;
using System.Windows.Shapes;
using static JewelleryStore.Views.DeleteStocks;

namespace JewelleryStore.Views
{
    /// <summary>
    /// Логика взаимодействия для DeleteStocks.xaml
    /// </summary>
    public partial class DeleteStocks : Page
    {
        public DeleteStocks()
        {
            InitializeComponent();
            DataContext = this;
            LoadDataFromDatabase();
        }

        private void LoadDataFromDatabase()
        {
            string connectionString = "Server=localhost,1433;Database=AppDB;User Id=sa;Password=aaaa_1111;Trusted_Connection=False;MultipleActiveResultSets=true;TrustServerCertificate=True";
            string query = "select DiscountAmount, IsBurgersDiscounted, IsShawarmasDiscounted, IsSaladsDiscounted, IsDrinksDiscounted from DISCOUNTSONGOODS";

            Discounts = new List<Discount>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    double discountAmount = reader.GetDouble(0);
                    int isBurgersDiscounted = reader.GetInt32(1);
                    int isShawarmasDiscounted = reader.GetInt32(2);
                    int isSaladsDiscounted = reader.GetInt32(3);
                    int isDrinksDiscounted = reader.GetInt32(4);

                    Discounts.Add(new Discount
                    {
                        DiscountAmount = discountAmount,
                        IsBurgersDiscounted = isBurgersDiscounted,
                        IsShawarmasDiscounted = isShawarmasDiscounted,
                        IsSaladsDiscounted = isSaladsDiscounted,
                        IsDrinksDiscounted = isDrinksDiscounted
                    });
                }
            }
        }

        public class Discount
        {
            public double DiscountAmount { get; set; }
            public int IsBurgersDiscounted { get; set; }
            public int IsShawarmasDiscounted { get; set; }
            public int IsSaladsDiscounted { get; set; }
            public int IsDrinksDiscounted { get; set; }
        }

        public List<Discount> Discounts { get; set; }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            Button deleteButton = (Button)sender;
            Discount discount = (Discount)deleteButton.DataContext;
            Discounts.Remove(discount);

            string connectionString = "Server=localhost,1433;Database=AppDB;User Id=sa;Password=aaaa_1111;Trusted_Connection=False;MultipleActiveResultSets=true;TrustServerCertificate=True";
            string updateHoldingDiscountQuery = "UPDATE PRODUCT SET Price = priceBeforeDiscount WHERE HoldingDiscount = 1";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand holdingDiscountCommand = new SqlCommand(updateHoldingDiscountQuery, connection);
                holdingDiscountCommand.ExecuteNonQuery();

                string updatePriceQuery = "UPDATE PRODUCT SET HoldingDiscount = 0 WHERE HoldingDiscount = 1";
                SqlCommand priceCommand = new SqlCommand(updatePriceQuery, connection);
                priceCommand.ExecuteNonQuery();

                string deleteQuery = "DELETE FROM DISCOUNTSONGOODS WHERE DiscountAmount = @DiscountAmount";
                SqlCommand deleteCommand = new SqlCommand(deleteQuery, connection);
                deleteCommand.Parameters.AddWithValue("@DiscountAmount", discount.DiscountAmount);
                deleteCommand.ExecuteNonQuery();

                NavigationService?.Refresh();
                SuccessfulRemovalOfPromotion deleteAdminWindow = new SuccessfulRemovalOfPromotion();
                deleteAdminWindow.ShowDialog();
            }
        }
    }
}
