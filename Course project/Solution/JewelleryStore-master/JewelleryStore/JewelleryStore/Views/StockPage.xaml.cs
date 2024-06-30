using Microsoft.Win32;
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
using Microsoft.EntityFrameworkCore;
using System.IO;
using Microsoft.Data.SqlClient;
using JewelleryStore.MessageWindows;
using MaterialDesignThemes.Wpf;
using System.Windows.Controls.Primitives;

namespace JewelleryStore.Views
{
    /// <summary>
    /// Логика взаимодействия для StockPage.xaml
    /// </summary>
    public partial class StockPage : Page
    {
        int error = 0;
        public StockPage()
        {
            InitializeComponent();
        }
        int[] selectedCheckBoxes = new int[4];

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            string input = SetTheDiscountAmount.Text;

            double discountAmount;

            string connectionString = "Server=localhost,1433;Database=AppDB;User Id=sa;Password=aaaa_1111;Trusted_Connection=False;MultipleActiveResultSets=true;TrustServerCertificate=True";

            if (double.TryParse(input, out discountAmount))
            {
                if (discountAmount >= 0 && discountAmount < 100)
                {
                    // Введенное значение является числом в диапазоне [0;100)

                    discountAmount = ((100 - discountAmount) / 100);

                   

                    if (checkBoxNecklaces.IsChecked == true) //бургеры
                    {
                        string query_1 = "SELECT IsBurgersDiscounted FROM DISCOUNTSONGOODS WHERE IsBurgersDiscounted = 1";

                        using (SqlConnection connection = new SqlConnection(connectionString))
                        {
                            SqlCommand command = new SqlCommand(query_1, connection);

                            connection.Open();
                            SqlDataReader reader = command.ExecuteReader();
                            if (reader.HasRows)
                            {
                                BurgerPromotionErrorWindow errorWindow = new BurgerPromotionErrorWindow();
                                errorWindow.ShowDialog();
                                error = error + 1;
                                selectedCheckBoxes[0] = 0;
                            }
                            else
                            {
                                selectedCheckBoxes[0] = 1;
                            }
                        }
                    }
                    else
                    {
                        selectedCheckBoxes[0] = 0;
                    }

                    if (checkBoxRings.IsChecked == true) //шаурма
                    {

                        string query_2 = "select IsShawarmasDiscounted from DISCOUNTSONGOODS where IsShawarmasDiscounted = 2";

                        using (SqlConnection connection = new SqlConnection(connectionString))
                        {
                            SqlCommand command = new SqlCommand(query_2, connection);

                            connection.Open();
                            SqlDataReader reader = command.ExecuteReader();
                            if (reader.HasRows)
                            {
                                ShawarmaPromotionError errorWindow = new ShawarmaPromotionError();
                                errorWindow.ShowDialog();
                                error = error + 1;
                                selectedCheckBoxes[1] = 0;
                            }
                            else
                            {
                                selectedCheckBoxes[1] = 2;
                            }
                        }
                    }
                    else
                    {
                        selectedCheckBoxes[1] = 0;
                    }

                    if (checkBoxEarrings.IsChecked == true) //салат
                    {
                        string query_3 = "select IsSaladsDiscounted from DISCOUNTSONGOODS where IsSaladsDiscounted = 3";

                        using (SqlConnection connection = new SqlConnection(connectionString))
                        {
                            SqlCommand command = new SqlCommand(query_3, connection);

                            connection.Open();
                            SqlDataReader reader = command.ExecuteReader();
                            if (reader.HasRows)
                            {
                                SaladPromotionError errorWindow = new SaladPromotionError();
                                errorWindow.ShowDialog();
                                error = error + 1;
                                selectedCheckBoxes[2] = 0;
                            }
                            else
                            {
                                selectedCheckBoxes[2] = 3;
                            }
                        }
                    }
                    else
                    {
                        selectedCheckBoxes[2] = 0;
                    }

                    if (checkBoxWristwear.IsChecked == true) //напитки
                    {
                        string query_4 = "select IsDrinksDiscounted from DISCOUNTSONGOODS where IsDrinksDiscounted = 4";

                        using (SqlConnection connection = new SqlConnection(connectionString))
                        {
                            SqlCommand command = new SqlCommand(query_4, connection);

                            connection.Open();
                            SqlDataReader reader = command.ExecuteReader();
                            if (reader.HasRows)
                            {
                                DrinksPromotionError errorWindow = new DrinksPromotionError();
                                errorWindow.ShowDialog();
                                error = error + 1;
                                selectedCheckBoxes[3] = 0;
                            }
                            else
                            {
                                selectedCheckBoxes[3] = 4;
                            }
                        }
                    }
                    else
                    {
                        selectedCheckBoxes[3] = 0;
                    }
                    string query_5 = "INSERT INTO DISCOUNTSONGOODS (DiscountAmount, IsBurgersDiscounted, IsShawarmasDiscounted, IsSaladsDiscounted, IsDrinksDiscounted) VALUES (@DiscountAmount, @IsBurgersDiscounted, @IsShawarmasDiscounted, @IsSaladsDiscounted, @IsDrinksDiscounted)";

                    bool allZero = selectedCheckBoxes.All(value => value == 0);
                    
                    if (error == 0)
                    {
                        if (!allZero)
                        {
                            using (SqlConnection connection = new SqlConnection(connectionString))
                            {
                                SqlCommand command = new SqlCommand(query_5, connection);
                                command.Parameters.AddWithValue("@DiscountAmount", discountAmount);
                                command.Parameters.AddWithValue("@IsBurgersDiscounted", selectedCheckBoxes[0]);
                                command.Parameters.AddWithValue("@IsShawarmasDiscounted", selectedCheckBoxes[1]);
                                command.Parameters.AddWithValue("@IsSaladsDiscounted", selectedCheckBoxes[2]);
                                command.Parameters.AddWithValue("@IsDrinksDiscounted", selectedCheckBoxes[3]);
                                connection.Open();
                                int rowsAffected = command.ExecuteNonQuery();
                                if (rowsAffected > 0)
                                {
                                    MessageOK messageWindow = new MessageOK();
                                    messageWindow.ShowDialog();
                                }
                            }
                            Update_Discounts(sender, e);
                        }
                        else
                        {
                            return;
                        }
                    }
                    else
                    {
                        CreatingDiscountErrorWindow messageWindow = new CreatingDiscountErrorWindow();
                        messageWindow.ShowDialog();
                    }
                    

                }
                else
                {
                    InputError messageWindow = new InputError();
                    messageWindow.ShowDialog();
                }
            }
            else
            {
                InputError messageWindow = new InputError();
                messageWindow.ShowDialog();
            } 
        }
        private void Update_Discounts(object sender, RoutedEventArgs e)
        {
            string connectionString = "Server=localhost,1433;Database=AppDB;User Id=sa;Password=aaaa_1111;Trusted_Connection=False;MultipleActiveResultSets=true;TrustServerCertificate=True";

            string updateQuery1 = "UPDATE PRODUCT SET priceBeforeDiscount = Price, Price = Price * (SELECT DiscountAmount FROM DISCOUNTSONGOODS WHERE IsBurgersDiscounted = 1), HoldingDiscount = 1 WHERE ProductType = (SELECT IsBurgersDiscounted FROM DISCOUNTSONGOODS)";

            string updateQuery2 = "UPDATE PRODUCT SET priceBeforeDiscount = Price, Price = Price * (SELECT DiscountAmount FROM DISCOUNTSONGOODS WHERE IsShawarmasDiscounted = 1), HoldingDiscount = 1 WHERE ProductType = (SELECT IsShawarmasDiscounted FROM DISCOUNTSONGOODS)";

            string updateQuery3 = "UPDATE PRODUCT SET priceBeforeDiscount = Price, Price = Price * (SELECT DiscountAmount FROM DISCOUNTSONGOODS WHERE IsSaladsDiscounted = 1), HoldingDiscount = 1 WHERE ProductType = (SELECT IsSaladsDiscounted FROM DISCOUNTSONGOODS)";

            string updateQuery4 = "UPDATE PRODUCT SET priceBeforeDiscount = Price, Price = Price * (SELECT DiscountAmount FROM DISCOUNTSONGOODS WHERE IsDrinksDiscounted = 1), HoldingDiscount = 1 WHERE ProductType = (SELECT IsDrinksDiscounted FROM DISCOUNTSONGOODS)";

            if (selectedCheckBoxes[0] == 1)
            {
                using (SqlConnection connection = new SqlConnection(connectionString)) //сикдки на бургеры
                {
                    SqlCommand command = new SqlCommand(updateQuery1, connection);

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (!reader.HasRows)
                    {
                        BurgerPromoSuccess messageWindow_1 = new BurgerPromoSuccess();
                        messageWindow_1.ShowDialog();
                    }
                }
            }

            if (selectedCheckBoxes[1] == 2)
            {
                using (SqlConnection connection = new SqlConnection(connectionString)) //скидки на шаверму
                {
                    SqlCommand command = new SqlCommand(updateQuery2, connection);

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (!reader.HasRows)
                    {
                        ShawermaPromoSuccess messageWindow_2 = new ShawermaPromoSuccess();
                        messageWindow_2.ShowDialog();
                    }
                }
            }

            
            if (selectedCheckBoxes[2] == 3)
            {
                using (SqlConnection connection = new SqlConnection(connectionString)) //скидки на салаты
                {
                    SqlCommand command = new SqlCommand(updateQuery3, connection);

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (!reader.HasRows)
                    {
                        SaladPromoSuccess messageWindow_3 = new SaladPromoSuccess();
                        messageWindow_3.ShowDialog();
                    }
                }
            }

            if (selectedCheckBoxes[3] == 4)
            {
                using (SqlConnection connection = new SqlConnection(connectionString)) //скидки на напитки
                {
                    SqlCommand command = new SqlCommand(updateQuery4, connection);

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (!reader.HasRows)
                    {
                        DrinksPromoSuccess messageWindow_4 = new DrinksPromoSuccess();
                        messageWindow_4.ShowDialog();
                    }
                }
            }
        }

    }
}
