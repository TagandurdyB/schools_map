class Asset {
  static const imgs = 'assets/imgs';
  static const logoLight = "$imgs/logo_light.png";
  static const logoDark = "$imgs/logo_dark.png";
  static const appIcon = "$imgs/app_icon.png";

  static const bg = "$imgs/bg.png";

  static const enFlag = "$imgs/en_flag.png";
  static const ruFlag = "$imgs/ru_flag.png";
  static const tmFlag = "$imgs/tm_flag.png";

  // ignore: library_private_types_in_public_api
  static _SVG svgs = _SVG('assets/svgs');
}

class _SVG {
  final String root;
  _SVG(this.root);
  withName(String n) {
    return "$root/$n.svg";
  }

  late String logo = "$root/logo.svg";
  late String textLogo = "$root/text_logo.svg";
  late String newMainlogo = "$root/_main_logo.svg";
  late String video = "$root/_video.svg";
  late String location = "$root/_location.svg";

  late final String orderCancelled = "$root/_order_cancelled.svg";
  late final String orderDelivered = "$root/_order_delivered.svg";
  late final String search = "$root/search.svg";
  late final String check = "$root/_check.svg";
  late final String info = "$root/_info.svg";
  late final String pickup = "$root/_pickup.svg";
  late final String searchrounded = "$root/_rounded_search.svg";
  late final String close = "$root/close.svg";
  late final String sort = "$root/sort.svg";
  late final String filter = "$root/filter.svg";
  late final String arrow = "$root/_arrow.svg";
  late final String trash = "$root/_trash.svg";
  late final String truck = "$root/_truck.svg";
  late final String smsNoticeBulk = "$root/sms_notification_bulk.svg";

//Accounts
  late final String _accounts = "$root/account";
  late final String aboutUs = "$_accounts/about_us.svg";
  late final String termsConditions = "$_accounts/terms_conditions.svg";
  late final String addressBook = "$_accounts/address_book.svg";
  late final String myOrders = "$_accounts/my_orders.svg";
  late final String deleteAccount = "$_accounts/delete_account.svg";
  late final String faqs = "$_accounts/FAQs.svg";
  late final String wishlist = "$_accounts/wishlist.svg";
  late final String signOut = "$_accounts/sign_out.svg";
  late final String contactUs = "$_accounts/contact_us.svg";
  late final String language = "$_accounts/language.svg";
  late final String reviewYourPurchases =
      "$_accounts/review_your_purchases.svg";
  late final String privacyPolicy = "$_accounts/privacy_policy.svg";

//product_policies
  late final String _productPolicies = "$root/product_policies";
  late final String bulkOrderPolicy = "$_productPolicies/bulk_order_policy.svg";
  late final String cancellation = "$_productPolicies/cancellation.svg";
  late final String freeDelivery = "$_productPolicies/free_pelivery.svg";
  late final String returnAndRefund = "$_productPolicies/return_&_refund .svg";
  late final String warranty = "$_productPolicies/warranty.svg";

//Empties
  late final String _empties = "$root/empties";
  late final String emptyWishList = "$_empties/wish_list.svg";
// seller
  late final String _seller = "$root/seller";

  late final String withdraw = "$_seller/_withdraw.svg";
  late final String totalSelling = "$_seller/total_selling.svg";
  late final String totalFunds = "$_seller/totalFunds.svg";
  late final String availableFunds = "$_seller/availableFunds.svg";
  late final String onHold = "$_seller/onHold.svg";
  late final String allWatch = "$_seller/allWatch.svg";
  late final String export = "$_seller/export.svg";
  late final String search2 = "$_seller/search.svg";
  late final String delete = "$_seller/delete.svg";
}
