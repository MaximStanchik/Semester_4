using JewelleryStore.MessageWindows;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
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

namespace JewelleryStore.Views
{
    /// <summary>
    /// Логика взаимодействия для OrderList.xaml
    /// </summary>
    public partial class OrderList : Page
    {
        public List<OrderBill> Bills { get; set; }

        public OrderList()
        {
            InitializeComponent();
            DataContext = this;
            LoadDataFromDatabase();
        }

        private void LoadDataFromDatabase()
        {
            string connectionString = "Server=localhost,1433;Database=AppDB;User Id=sa;Password=aaaa_1111;Trusted_Connection=False;MultipleActiveResultSets=true;TrustServerCertificate=True";
            string query = "SELECT FirstQuery.BillId, SecondQuery.ProductInfo, FirstQuery.DateOfOrder, FirstQuery.TotalPrice, FirstQuery.NickName, FirstQuery.GivenName, FirstQuery.LastName, FirstQuery.Email, FirstQuery.DeliveryType, FirstQuery.City, FirstQuery.Street, FirstQuery.House, FirstQuery.Apartment, FirstQuery.Entrance, FirstQuery.Floor, FirstQuery.Comment, FirstQuery.Status FROM ( SELECT BILL.BillId, DateOfOrder, TotalPrice, NickName, GivenName, LastName, Email, DeliveryType, City, Street, House, Apartment, Entrance, Floor, Comment, Bill.Status FROM BILL INNER JOIN USERS ON BILL.UserId = USERS.UserId INNER JOIN ORDER_INFO ON BILL.BillId = ORDER_INFO.BillId ) AS FirstQuery JOIN ( SELECT BillId, STRING_AGG(CONCAT(DICTIONARY.WordRus, ' * ', ORDER_INFO.Quantity), ', ') AS ProductInfo FROM ORDER_INFO INNER JOIN PRODUCT ON PRODUCT.ProductCode = ORDER_INFO.ProductCode INNER JOIN DICTIONARY ON PRODUCT.PName = DICTIONARY.WordId GROUP BY BillId ) AS SecondQuery ON FirstQuery.BillId = SecondQuery.BillId;";
            Bills = new List<OrderBill>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int billId = reader.GetInt32(0);
                    string productInfo = reader.GetString(1);
                    DateTime dateOfOrder = reader.GetDateTime(2);
                    decimal totalPrice = reader.GetDecimal(3);
                    string nickName = reader.GetString(4);
                    string givenName = reader.GetString(5);
                    string lastName = reader.GetString(6);
                    string email = reader.GetString(7);
                    string deliveryType = reader.GetString(8);
                    string city = reader.GetString(9);
                    string street = reader.GetString(10);
                    string house = reader.GetString(11);
                    string apartment = reader.GetString(12);
                    string entrance = reader.GetString(13);
                    int floor = reader.GetInt32(14);
                    string comment = reader.GetString(15);
                    string status = reader.GetString(16);

                    Bills.Add(new OrderBill
                    {
                        BillId = billId,
                        ProductInfo = productInfo,
                        DateOfOrder = dateOfOrder,
                        TotalPrice = totalPrice,
                        NickName = nickName,
                        GivenName = givenName,
                        LastName = lastName,
                        Email = email,
                        DeliveryType = deliveryType,
                        City = city,
                        Street = street,
                        House = house,
                        Apartment = apartment,
                        Entrance = entrance,
                        Floor = floor,
                        Comment = comment,
                        Status = status
                    });
                }
            }
        }

        private void ChangeStatus_Click(object sender, RoutedEventArgs e)
        {
            Button changeStatusButton = (Button)sender;
            DataGridRow row = FindParent<DataGridRow>(changeStatusButton);

            if (row != null && row.DataContext is OrderBill bill)
            {
                int billId = bill.BillId;
                string givenName = bill.GivenName;
                string deliveryType = bill.DeliveryType;
                string productInfo = bill.ProductInfo;
                string status = bill.Status;
                decimal totalPrice = bill.TotalPrice;
                string comment = bill.Comment;
                string clientEmail = bill.Email;

                ChangeStatus changeStatusWindow = new ChangeStatus(billId, givenName, deliveryType, productInfo, totalPrice, comment, clientEmail);
                changeStatusWindow.ShowDialog();

                //SendMessageForm sendMessageForm = new SendMessageForm(givenName, billId, deliveryType, productInfo, status, totalPrice, comment, clientEmail);
                //sendMessageForm.Show();
            }
            NavigationService?.Refresh();
        }

        private void SendMessage_Click(object sender, RoutedEventArgs e)
        {
            Button sendMessageButton = (Button)sender;
            DataGridRow row = FindParent<DataGridRow>(sendMessageButton);
            if (row != null && row.DataContext is OrderBill bill)
            {
                string givenName = bill.GivenName;
                int billId = bill.BillId;
                string deliveryType = bill.DeliveryType;
                string productInfo = bill.ProductInfo;
                string status = bill.Status;
                decimal totalPrice = bill.TotalPrice;
                string comment = bill.Comment;
                string clientEmail = bill.Email;

                SendMessageForm sendMessageForm = new SendMessageForm(givenName, billId, deliveryType, productInfo, status, totalPrice, comment, clientEmail);
                sendMessageForm.Show();
            }
        }
        private T FindParent<T>(DependencyObject child) where T : DependencyObject
        {
            DependencyObject parent = VisualTreeHelper.GetParent(child);

            if (parent == null)
                return null;

            if (parent is T typedParent)
                return typedParent;

            return FindParent<T>(parent);
        }
    }

    public class OrderBill
    {
        public int BillId { get; set; }
        public string ProductInfo { get; set; }
        public DateTime DateOfOrder { get; set; }
        public decimal TotalPrice { get; set; }
        public string NickName { get; set; }
        public string GivenName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string DeliveryType { get; set; }
        public string City { get; set; }
        public string Street { get; set; }
        public string House { get; set; }
        public string Apartment { get; set; }
        public string Entrance { get; set; }
        public int Floor { get; set; }
        public string Comment { get; set; }
        public string Status { get; set; }
    }
}