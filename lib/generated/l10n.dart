// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Good morning!...`
  String get goodMorning {
    return Intl.message(
      'Good morning!...',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `Please select a payment method`
  String get selectPaymentMethod {
    return Intl.message(
      'Please select a payment method',
      name: 'selectPaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Pay with PayPal`
  String get payWithPayPal {
    return Intl.message(
      'Pay with PayPal',
      name: 'payWithPayPal',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong during payment`
  String get paymentProcessError {
    return Intl.message(
      'Something went wrong during payment',
      name: 'paymentProcessError',
      desc: '',
      args: [],
    );
  }

  /// `My account`
  String get myAccount {
    return Intl.message('My account', name: 'myAccount', desc: '', args: []);
  }

  /// `Profile photo updated successfully`
  String get photoUpdatedSuccess {
    return Intl.message(
      'Profile photo updated successfully',
      name: 'photoUpdatedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Error updating profile photo`
  String get photoUpdateError {
    return Intl.message(
      'Error updating profile photo',
      name: 'photoUpdateError',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get generalSection {
    return Intl.message('General', name: 'generalSection', desc: '', args: []);
  }

  /// `Profile`
  String get personalProfile {
    return Intl.message('Profile', name: 'personalProfile', desc: '', args: []);
  }

  /// `Favorites`
  String get favorites {
    return Intl.message('Favorites', name: 'favorites', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `Appearance`
  String get appearanceMode {
    return Intl.message(
      'Appearance',
      name: 'appearanceMode',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message('Help', name: 'help', desc: '', args: []);
  }

  /// `About us`
  String get whoWeAre {
    return Intl.message('About us', name: 'whoWeAre', desc: '', args: []);
  }

  /// `Shipping`
  String get shippingTitle {
    return Intl.message('Shipping', name: 'shippingTitle', desc: '', args: []);
  }

  /// `Something went wrong. Please try again.`
  String get genericAuthError {
    return Intl.message(
      'Something went wrong. Please try again.',
      name: 'genericAuthError',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong. Please try again.`
  String get genericAuthErrorAlt {
    return Intl.message(
      'Something went wrong. Please try again.',
      name: 'genericAuthErrorAlt',
      desc: '',
      args: [],
    );
  }

  /// `Home Dreams`
  String get appName {
    return Intl.message('Home Dreams', name: 'appName', desc: '', args: []);
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Search results`
  String get searchResultsTitle {
    return Intl.message(
      'Search results',
      name: 'searchResultsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Recent searches`
  String get recentSearches {
    return Intl.message(
      'Recent searches',
      name: 'recentSearches',
      desc: '',
      args: [],
    );
  }

  /// `Clear all`
  String get deleteAll {
    return Intl.message('Clear all', name: 'deleteAll', desc: '', args: []);
  }

  /// `No search results`
  String get noSearchResults {
    return Intl.message(
      'No search results',
      name: 'noSearchResults',
      desc: '',
      args: [],
    );
  }

  /// `Sorry… this information is not available at the moment`
  String get infoNotAvailable {
    return Intl.message(
      'Sorry… this information is not available at the moment',
      name: 'infoNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Sort by:`
  String get sortBy {
    return Intl.message('Sort by:', name: 'sortBy', desc: '', args: []);
  }

  /// `Price (low to high)`
  String get priceLowToHigh {
    return Intl.message(
      'Price (low to high)',
      name: 'priceLowToHigh',
      desc: '',
      args: [],
    );
  }

  /// `Price (high to low)`
  String get priceHighToLow {
    return Intl.message(
      'Price (high to low)',
      name: 'priceHighToLow',
      desc: '',
      args: [],
    );
  }

  /// `Clear sorting`
  String get clearSort {
    return Intl.message('Clear sorting', name: 'clearSort', desc: '', args: []);
  }

  /// `Filter`
  String get filter {
    return Intl.message('Filter', name: 'filter', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Log out`
  String get logout {
    return Intl.message('Log out', name: 'logout', desc: '', args: []);
  }

  /// `Personal information`
  String get personalInfo {
    return Intl.message(
      'Personal information',
      name: 'personalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get fullNameHint {
    return Intl.message('Full name', name: 'fullNameHint', desc: '', args: []);
  }

  /// `Email`
  String get emailHint {
    return Intl.message('Email', name: 'emailHint', desc: '', args: []);
  }

  /// `Change password`
  String get changePassword {
    return Intl.message(
      'Change password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Current password`
  String get currentPasswordHint {
    return Intl.message(
      'Current password',
      name: 'currentPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your current password`
  String get currentPasswordRequired {
    return Intl.message(
      'Please enter your current password',
      name: 'currentPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get newPasswordHint {
    return Intl.message(
      'New password',
      name: 'newPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a new password`
  String get newPasswordRequired {
    return Intl.message(
      'Please enter a new password',
      name: 'newPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Confirm new password`
  String get confirmNewPasswordHint {
    return Intl.message(
      'Confirm new password',
      name: 'confirmNewPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your password`
  String get confirmPasswordRequired {
    return Intl.message(
      'Please confirm your password',
      name: 'confirmPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code we sent to the following email address`
  String get confirmCodeEmailIntro {
    return Intl.message(
      'Enter the code we sent to the following email address',
      name: 'confirmCodeEmailIntro',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Save changes`
  String get saveChanges {
    return Intl.message(
      'Save changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Changes saved successfully`
  String get editSuccess {
    return Intl.message(
      'Changes saved successfully',
      name: 'editSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Check your inbox to verify`
  String get checkEmailForVerification {
    return Intl.message(
      'Check your inbox to verify',
      name: 'checkEmailForVerification',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Get started`
  String get getStarted {
    return Intl.message('Get started', name: 'getStarted', desc: '', args: []);
  }

  /// `Shop the best home essentials with great quality and fair prices, and order everything you need easily from one place.`
  String get onboarding1Subtitle {
    return Intl.message(
      'Shop the best home essentials with great quality and fair prices, and order everything you need easily from one place.',
      name: 'onboarding1Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to`
  String get onboardingWelcome {
    return Intl.message(
      'Welcome to',
      name: 'onboardingWelcome',
      desc: '',
      args: [],
    );
  }

  /// ` Home Dreams`
  String get onboardingBrand {
    return Intl.message(
      ' Home Dreams',
      name: 'onboardingBrand',
      desc: '',
      args: [],
    );
  }

  /// `Discover a wide range of home and furniture products and stay ready for every household need with an easy, fast shopping experience.`
  String get onboarding2Subtitle {
    return Intl.message(
      'Discover a wide range of home and furniture products and stay ready for every household need with an easy, fast shopping experience.',
      name: 'onboarding2Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Your home matters`
  String get onboarding2Title {
    return Intl.message(
      'Your home matters',
      name: 'onboarding2Title',
      desc: '',
      args: [],
    );
  }

  /// `Save time and effort and shop home essentials at the best prices with fast delivery and reliable service to your door.`
  String get onboarding3Subtitle {
    return Intl.message(
      'Save time and effort and shop home essentials at the best prices with fast delivery and reliable service to your door.',
      name: 'onboarding3Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Shop smart`
  String get onboarding3Title {
    return Intl.message(
      'Shop smart',
      name: 'onboarding3Title',
      desc: '',
      args: [],
    );
  }

  /// `results`
  String get resultsWord {
    return Intl.message('results', name: 'resultsWord', desc: '', args: []);
  }

  /// `Product added successfully`
  String get productAddedSuccess {
    return Intl.message(
      'Product added successfully',
      name: 'productAddedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Product removed successfully`
  String get productRemovedSuccess {
    return Intl.message(
      'Product removed successfully',
      name: 'productRemovedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Shop now`
  String get shopNow {
    return Intl.message('Shop now', name: 'shopNow', desc: '', args: []);
  }

  /// `Holiday offers`
  String get eidOffers {
    return Intl.message(
      'Holiday offers',
      name: 'eidOffers',
      desc: '',
      args: [],
    );
  }

  /// `25% off`
  String get discount25 {
    return Intl.message('25% off', name: 'discount25', desc: '', args: []);
  }

  /// `Your cart is empty`
  String get cartEmpty {
    return Intl.message(
      'Your cart is empty',
      name: 'cartEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Pay `
  String get payWord {
    return Intl.message('Pay ', name: 'payWord', desc: '', args: []);
  }

  /// `EGP`
  String get currencyEgp {
    return Intl.message('EGP', name: 'currencyEgp', desc: '', args: []);
  }

  /// `Cart`
  String get cartTitle {
    return Intl.message('Cart', name: 'cartTitle', desc: '', args: []);
  }

  /// `kg`
  String get unitKg {
    return Intl.message('kg', name: 'unitKg', desc: '', args: []);
  }

  /// `Home`
  String get navHome {
    return Intl.message('Home', name: 'navHome', desc: '', args: []);
  }

  /// `Products`
  String get navProducts {
    return Intl.message('Products', name: 'navProducts', desc: '', args: []);
  }

  /// `Cart`
  String get navCart {
    return Intl.message('Cart', name: 'navCart', desc: '', args: []);
  }

  /// `Account`
  String get navAccount {
    return Intl.message('Account', name: 'navAccount', desc: '', args: []);
  }

  /// `Best sellers`
  String get bestSelling {
    return Intl.message(
      'Best sellers',
      name: 'bestSelling',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get seeMore {
    return Intl.message('More', name: 'seeMore', desc: '', args: []);
  }

  /// `Products`
  String get products {
    return Intl.message('Products', name: 'products', desc: '', args: []);
  }

  /// `Cash on delivery`
  String get cashOnDelivery {
    return Intl.message(
      'Cash on delivery',
      name: 'cashOnDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Pickup from location`
  String get deliveryFromPlace {
    return Intl.message(
      'Pickup from location',
      name: 'deliveryFromPlace',
      desc: '',
      args: [],
    );
  }

  /// `Pay online`
  String get payOnline {
    return Intl.message('Pay online', name: 'payOnline', desc: '', args: []);
  }

  /// `Delivery address`
  String get deliveryAddress {
    return Intl.message(
      'Delivery address',
      name: 'deliveryAddress',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Order summary`
  String get orderSummary {
    return Intl.message(
      'Order summary',
      name: 'orderSummary',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal:`
  String get subtotalLabel {
    return Intl.message('Subtotal:', name: 'subtotalLabel', desc: '', args: []);
  }

  /// `Delivery:`
  String get deliveryLabel {
    return Intl.message('Delivery:', name: 'deliveryLabel', desc: '', args: []);
  }

  /// `40 EGP`
  String get deliveryFee {
    return Intl.message('40 EGP', name: 'deliveryFee', desc: '', args: []);
  }

  /// `Total`
  String get totalLabel {
    return Intl.message('Total', name: 'totalLabel', desc: '', args: []);
  }

  /// `Shipping`
  String get checkoutStepShipping {
    return Intl.message(
      'Shipping',
      name: 'checkoutStepShipping',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get checkoutStepAddress {
    return Intl.message(
      'Address',
      name: 'checkoutStepAddress',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get checkoutStepPayment {
    return Intl.message(
      'Payment',
      name: 'checkoutStepPayment',
      desc: '',
      args: [],
    );
  }

  /// `Order completed successfully`
  String get orderSuccess {
    return Intl.message(
      'Order completed successfully',
      name: 'orderSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Product added to cart`
  String get addedToCartSnackbar {
    return Intl.message(
      'Product added to cart',
      name: 'addedToCartSnackbar',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account, you agree to our `
  String get termsAgreementPrefix {
    return Intl.message(
      'By creating an account, you agree to our ',
      name: 'termsAgreementPrefix',
      desc: '',
      args: [],
    );
  }

  /// `terms and conditions`
  String get termsAndConditions {
    return Intl.message(
      'terms and conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `You must accept the terms and policies`
  String get mustAcceptTerms {
    return Intl.message(
      'You must accept the terms and policies',
      name: 'mustAcceptTerms',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get createNewAccount {
    return Intl.message(
      'Create account',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIn {
    return Intl.message('Sign in', name: 'signIn', desc: '', args: []);
  }

  /// `Forgot password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get signInWithGoogle {
    return Intl.message(
      'Sign in with Google',
      name: 'signInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Apple`
  String get signInWithApple {
    return Intl.message(
      'Sign in with Apple',
      name: 'signInWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Facebook`
  String get signInWithFacebook {
    return Intl.message(
      'Sign in with Facebook',
      name: 'signInWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get orDivider {
    return Intl.message('or', name: 'orDivider', desc: '', args: []);
  }

  /// `New account`
  String get newAccountTitle {
    return Intl.message(
      'New account',
      name: 'newAccountTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create a new password to sign in`
  String get createNewPasswordDescription {
    return Intl.message(
      'Create a new password to sign in',
      name: 'createNewPasswordDescription',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPasswordHint {
    return Intl.message(
      'Confirm password',
      name: 'confirmPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Create new password`
  String get createNewPassword {
    return Intl.message(
      'Create new password',
      name: 'createNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get newPasswordTitle {
    return Intl.message(
      'New password',
      name: 'newPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get forgotPasswordTitle {
    return Intl.message(
      'Forgot password',
      name: 'forgotPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Verify code`
  String get verifyCodeTitle {
    return Intl.message(
      'Verify code',
      name: 'verifyCodeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get haveAccountQuestion {
    return Intl.message(
      'Already have an account?',
      name: 'haveAccountQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get login {
    return Intl.message('Sign in', name: 'login', desc: '', args: []);
  }

  /// `Don't have an account?`
  String get noAccountQuestion {
    return Intl.message(
      'Don\'t have an account?',
      name: 'noAccountQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get createAccountCta {
    return Intl.message(
      'Create an account',
      name: 'createAccountCta',
      desc: '',
      args: [],
    );
  }

  /// `Verify code`
  String get verifyCode {
    return Intl.message('Verify code', name: 'verifyCode', desc: '', args: []);
  }

  /// `Resend code`
  String get resendCode {
    return Intl.message('Resend code', name: 'resendCode', desc: '', args: []);
  }

  /// `Password changed successfully!`
  String get passwordChangedSuccess {
    return Intl.message(
      'Password changed successfully!',
      name: 'passwordChangedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `Search…`
  String get searchHint {
    return Intl.message('Search…', name: 'searchHint', desc: '', args: []);
  }

  /// `EGP`
  String get pricePerEgp {
    return Intl.message('EGP', name: 'pricePerEgp', desc: '', args: []);
  }

  /// `Please fill in this field`
  String get fieldRequired {
    return Intl.message(
      'Please fill in this field',
      name: 'fieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordHintDefault {
    return Intl.message(
      'Password',
      name: 'passwordHintDefault',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get passwordRequiredDefault {
    return Intl.message(
      'Please enter your password',
      name: 'passwordRequiredDefault',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your full name`
  String get nameRequired {
    return Intl.message(
      'Please enter your full name',
      name: 'nameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get emailRequired {
    return Intl.message(
      'Please enter your email',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the address`
  String get addressRequired {
    return Intl.message(
      'Please enter the address',
      name: 'addressRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the city`
  String get cityRequired {
    return Intl.message(
      'Please enter the city',
      name: 'cityRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter floor / apartment number`
  String get floorApartmentRequired {
    return Intl.message(
      'Please enter floor / apartment number',
      name: 'floorApartmentRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the phone number`
  String get phoneRequired {
    return Intl.message(
      'Please enter the phone number',
      name: 'phoneRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter verification code`
  String get verificationCodeRequired {
    return Intl.message(
      'Enter verification code',
      name: 'verificationCodeRequired',
      desc: '',
      args: [],
    );
  }

  /// `Verification code`
  String get verificationCodeHint {
    return Intl.message(
      'Verification code',
      name: 'verificationCodeHint',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get addressFullNameHint {
    return Intl.message(
      'Full name',
      name: 'addressFullNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get addressHint {
    return Intl.message('Address', name: 'addressHint', desc: '', args: []);
  }

  /// `City`
  String get cityHint {
    return Intl.message('City', name: 'cityHint', desc: '', args: []);
  }

  /// `Floor no., apartment no.`
  String get floorApartmentHint {
    return Intl.message(
      'Floor no., apartment no.',
      name: 'floorApartmentHint',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneHint {
    return Intl.message('Phone number', name: 'phoneHint', desc: '', args: []);
  }

  /// `Don't worry, enter your email and we'll send you a verification code.`
  String get forgotPasswordDescription {
    return Intl.message(
      'Don\'t worry, enter your email and we\'ll send you a verification code.',
      name: 'forgotPasswordDescription',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get emailIncorrect {
    return Intl.message(
      'Invalid email',
      name: 'emailIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Password reset link sent`
  String get resetEmailSent {
    return Intl.message(
      'Password reset link sent',
      name: 'resetEmailSent',
      desc: '',
      args: [],
    );
  }

  /// `Error sending email`
  String get sendError {
    return Intl.message(
      'Error sending email',
      name: 'sendError',
      desc: '',
      args: [],
    );
  }

  /// `Send verification code`
  String get sendVerificationCode {
    return Intl.message(
      'Send verification code',
      name: 'sendVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `You have `
  String get cartYouHave {
    return Intl.message('You have ', name: 'cartYouHave', desc: '', args: []);
  }

  /// ` products in your cart`
  String get cartProductsSuffix {
    return Intl.message(
      ' products in your cart',
      name: 'cartProductsSuffix',
      desc: '',
      args: [],
    );
  }

  /// `About `
  String get aboutCompanyPrefix {
    return Intl.message(
      'About ',
      name: 'aboutCompanyPrefix',
      desc: '',
      args: [],
    );
  }

  /// `We are Home Dreams for trading and selling home furniture, a Saudi company based in Jeddah – Saudi Arabia. Founded in 2022 to offer complete solutions in modern and classic home furniture for different tastes and spaces.`
  String get whoAreWeIntro {
    return Intl.message(
      'We are Home Dreams for trading and selling home furniture, a Saudi company based in Jeddah – Saudi Arabia. Founded in 2022 to offer complete solutions in modern and classic home furniture for different tastes and spaces.',
      name: 'whoAreWeIntro',
      desc: '',
      args: [],
    );
  }

  /// `Since our founding, we focus on quality, elegant design, and competitive prices, with high service standards and customer satisfaction.`
  String get whoAreWeParagraph2 {
    return Intl.message(
      'Since our founding, we focus on quality, elegant design, and competitive prices, with high service standards and customer satisfaction.',
      name: 'whoAreWeParagraph2',
      desc: '',
      args: [],
    );
  }

  /// `Our services`
  String get ourServices {
    return Intl.message(
      'Our services',
      name: 'ourServices',
      desc: '',
      args: [],
    );
  }

  /// `• Home furniture (bedrooms, living rooms, dining rooms).\n• Office furniture and distinctive décor.\n• Designs for modern and classic spaces.\n• Fast, safe delivery across the Kingdom.\n• Support and customer service for orders and questions.`
  String get whoAreWeServicesList {
    return Intl.message(
      '• Home furniture (bedrooms, living rooms, dining rooms).\n• Office furniture and distinctive décor.\n• Designs for modern and classic spaces.\n• Fast, safe delivery across the Kingdom.\n• Support and customer service for orders and questions.',
      name: 'whoAreWeServicesList',
      desc: '',
      args: [],
    );
  }

  /// `Password is too weak`
  String get weakPassword {
    return Intl.message(
      'Password is too weak',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `You are already registered. Please sign in.`
  String get emailAlreadyInUse {
    return Intl.message(
      'You are already registered. Please sign in.',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get noInternet {
    return Intl.message(
      'No internet connection',
      name: 'noInternet',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email format`
  String get invalidEmailFormat {
    return Intl.message(
      'Invalid email format',
      name: 'invalidEmailFormat',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect email or password`
  String get wrongCredentials {
    return Intl.message(
      'Incorrect email or password',
      name: 'wrongCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Error updating name`
  String get nameUpdateError {
    return Intl.message(
      'Error updating name',
      name: 'nameUpdateError',
      desc: '',
      args: [],
    );
  }

  /// `User is not signed in`
  String get notSignedIn {
    return Intl.message(
      'User is not signed in',
      name: 'notSignedIn',
      desc: '',
      args: [],
    );
  }

  /// `Error updating password`
  String get passwordUpdateError {
    return Intl.message(
      'Error updating password',
      name: 'passwordUpdateError',
      desc: '',
      args: [],
    );
  }

  /// `Current password is incorrect`
  String get wrongCurrentPassword {
    return Intl.message(
      'Current password is incorrect',
      name: 'wrongCurrentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Error updating email`
  String get emailUpdateError {
    return Intl.message(
      'Error updating email',
      name: 'emailUpdateError',
      desc: '',
      args: [],
    );
  }

  /// `Contact us for any questions on your order.`
  String get paypalNote {
    return Intl.message(
      'Contact us for any questions on your order.',
      name: 'paypalNote',
      desc: '',
      args: [],
    );
  }

  /// `Choose language`
  String get chooseLanguage {
    return Intl.message(
      'Choose language',
      name: 'chooseLanguage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
