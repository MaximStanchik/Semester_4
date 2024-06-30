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
using JewelleryStore;

namespace JewelleryStore.MessageWindows
{
    /// <summary>
    /// Логика взаимодействия для DeliveryForm.xaml
    /// </summary>
    public partial class DeliveryForm : Window
    {
        MainWindowViewModel mainWindowViewModel = new MainWindowViewModel();
        string clientCity;
        string clientStreet;
        string clientHouse;
        string clientApartment;
        string clientEntrance;
        int clientFloor;
        string clientComment;
        bool acceptOrderForm = true;
        public DeliveryForm()
        {
            InitializeComponent();
        }
        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
        private void OrderButton_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(Floor.Text))
            {
                FloorError.Visibility = Visibility.Hidden;
            }
            else if (Int32.TryParse(Floor.Text, out int clientFloor))
            {
                if (clientFloor < 1)
                {
                    FloorError.Visibility = Visibility.Visible;
                    acceptOrderForm = false;
                }
                else
                {
                    FloorError.Visibility = Visibility.Hidden;
                }
            }
            else
            {
                FloorError.Visibility = Visibility.Visible;
                acceptOrderForm = false;
            }

            if (string.IsNullOrWhiteSpace(City.Text))
            {
                CityError.Visibility = Visibility.Visible;
                acceptOrderForm = false;
            }
            else
            {
                CityError.Visibility = Visibility.Hidden;
                acceptOrderForm = true;
            }

            if (string.IsNullOrWhiteSpace(Street.Text))
            {
                StreetError.Visibility = Visibility.Visible;
                acceptOrderForm = false;
            }
            else
            {
                StreetError.Visibility = Visibility.Hidden;
                acceptOrderForm = true;
            }

            if (acceptOrderForm == true)
            {
                clientCity = City.Text;
                clientStreet = Street.Text;
                clientHouse = House.Text;
                clientApartment = Apartment.Text;
                clientEntrance = Entrance.Text;
                clientComment = Comment.Text;

                mainWindowViewModel.CreateAnOrder(clientCity, clientApartment, clientEntrance, clientFloor, clientStreet, "Доставка", "В ожидании", clientComment, clientHouse);

            }
        }
    }
}
