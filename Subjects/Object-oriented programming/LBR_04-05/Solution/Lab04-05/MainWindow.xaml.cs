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
using Lab04_05;

namespace Lab04_05
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public int filterON;
        public int filterOFF;

        public int necklace;
        public int rings;
        public int earrings;
        public int bracelets;
        public MainWindow()
        {
            InitializeComponent();
            myFrame.Source = new Uri("pack://application:,,,/ProductsPage.xaml");
            Cursor = CursorCollection.GetCursor();
        }

        // Свойство для команды AddCommand
        public ICommand AddCommand { get; set; }

        private void ToRussian()
        {
            Application.Current.Resources.MergedDictionaries.Remove(Settings.ResourceEnLang);
            Application.Current.Resources.MergedDictionaries.Add(Settings.ResourceRusLang);
            Settings.Lang = Settings.Languages.RU;
        }

        private void ToEnglish()
        {
            Application.Current.Resources.MergedDictionaries.Remove(Settings.ResourceRusLang);
            Application.Current.Resources.MergedDictionaries.Add(Settings.ResourceEnLang);
            Settings.Lang = Settings.Languages.EN;
        }

        private void ShowProducts(object sender, RoutedEventArgs e)
        {
            myFrame.Source = new Uri("pack://application:,,,/ProductsPage.xaml");
        }
        private void SwitchLang(object sender, RoutedEventArgs e)
        {
            if ((bool)Lang.IsChecked)
                ToEnglish();
            else
                ToRussian();
        }

        private void RadioButtonFilterON_Checked(object sender, RoutedEventArgs e)
        {
            if (sender is RadioButton radioButton && radioButton.IsChecked == true)
            {
                filterON = 1;
            }
            else
            {
                filterON = -1;
            }
        }

        private void RadioButtonFilterOFF_Checked(object sender, RoutedEventArgs e)
        {
            if (sender is RadioButton radioButton && radioButton.IsChecked == true)
            {
                filterOFF = 1;
            }
            else
            {
                filterOFF = -1;
            }
        }

        private void RadioButtonNecklaces_Checked(object sender, RoutedEventArgs e, int filterON, int filterOFF)
        {
            if (sender is RadioButton radioButton && radioButton.IsChecked == true && filterON == 1 && filterOFF == -1)
            {
                necklace = 1;
            }
            else
            {
                necklace = -1;
            }
        }
        private void RadioButtonRings_Checked(object sender, RoutedEventArgs e, int filterON, int filterOFF)
        {
            if (sender is RadioButton radioButton && radioButton.IsChecked == true && filterON == 1 && filterOFF == -1)
            {
                rings = 1;
            }
            else
            {
                rings = -1;
            }
        }
        private void RadioButtonEarrings_Checked(object sender, RoutedEventArgs e, int filterON, int filterOFF)
        {
            if (sender is RadioButton radioButton && radioButton.IsChecked == true && filterON == 1 && filterOFF == -1)
            {
                earrings = 1;
            }
            else
            {
                earrings = -1;
            }
        }
        private void RadioButtonBracelets_Checked(object sender, RoutedEventArgs e, int filterON, int filterOFF)
        {
            if (sender is RadioButton radioButton && radioButton.IsChecked == true && filterON == 1 && filterOFF == -1)
            {
                bracelets = 1;
            }
            else
            {
                bracelets = -1;
            }
        }
    }
}
