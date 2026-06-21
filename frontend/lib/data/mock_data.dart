final mockUserJson = {
  'id': 'user_1',
  'email': 'demo@example.com',
  'full_name': 'Ahmed Al Mansouri',
  'phone': '+971-50-123-4567',
  'avatar_url': 'https://i.pravatar.cc/150?u=user_1',
  'is_verified': true,
  'is_dealer': true,
  'dealer_name': 'Al Mansouri Auto Trading',
  'location': 'Dubai, UAE',
  'join_date': '2023-06-15T10:00:00Z',
  'last_active': '2026-05-23T14:30:00Z',
  'roles': ['user', 'dealer'],
};

final mockUser2Json = {
  'id': 'user_2',
  'email': 'fatima@example.com',
  'full_name': 'Fatima Al Hashimi',
  'phone': '+971-55-987-6543',
  'avatar_url': 'https://i.pravatar.cc/150?u=user_2',
  'is_verified': true,
  'is_dealer': false,
  'location': 'Abu Dhabi, UAE',
  'join_date': '2024-01-10T08:00:00Z',
  'last_active': '2026-05-24T09:00:00Z',
  'roles': ['user'],
};

final mockFeatures = [
  {'id': 'f1', 'name': 'Sunroof', 'category': 'Comfort'},
  {'id': 'f2', 'name': 'Leather Seats', 'category': 'Interior'},
  {'id': 'f3', 'name': 'Navigation System', 'category': 'Technology'},
  {'id': 'f4', 'name': 'Blind Spot Monitor', 'category': 'Safety'},
  {'id': 'f5', 'name': '360 Camera', 'category': 'Safety'},
  {'id': 'f6', 'name': 'Apple CarPlay', 'category': 'Technology'},
  {'id': 'f7', 'name': 'Heated Seats', 'category': 'Comfort'},
  {'id': 'f8', 'name': 'Adaptive Cruise Control', 'category': 'Technology'},
  {'id': 'f9', 'name': 'Wireless Charging', 'category': 'Technology'},
  {'id': 'f10', 'name': 'Premium Audio', 'category': 'Entertainment'},
];

final mockMakes = [
  {'id': 'make_1', 'name': 'Toyota', 'logo_url': 'https://logo.clearbit.com/toyota.com', 'country': 'Japan'},
  {'id': 'make_2', 'name': 'Mercedes-Benz', 'logo_url': 'https://logo.clearbit.com/mercedes-benz.com', 'country': 'Germany'},
  {'id': 'make_3', 'name': 'BMW', 'logo_url': 'https://logo.clearbit.com/bmw.com', 'country': 'Germany'},
  {'id': 'make_4', 'name': 'Nissan', 'logo_url': 'https://logo.clearbit.com/nissan.com', 'country': 'Japan'},
];

final mockModels = [
  {'id': 'model_1', 'make_id': 'make_1', 'name': 'Land Cruiser', 'start_year': 2000, 'end_year': 2026},
  {'id': 'model_2', 'make_id': 'make_1', 'name': 'Camry', 'start_year': 2000, 'end_year': 2026},
  {'id': 'model_3', 'make_id': 'make_2', 'name': 'G-Class', 'start_year': 2010, 'end_year': 2026},
  {'id': 'model_4', 'make_id': 'make_2', 'name': 'C-Class', 'start_year': 2000, 'end_year': 2026},
  {'id': 'model_5', 'make_id': 'make_3', 'name': 'X5', 'start_year': 2005, 'end_year': 2026},
  {'id': 'model_6', 'make_id': 'make_3', 'name': '3 Series', 'start_year': 2000, 'end_year': 2026},
  {'id': 'model_7', 'make_id': 'make_4', 'name': 'Patrol', 'start_year': 2000, 'end_year': 2026},
  {'id': 'model_8', 'make_id': 'make_4', 'name': 'Altima', 'start_year': 2000, 'end_year': 2026},
];

final mockCategories = [
  {'id': 'cat_1', 'name': 'SUV', 'slug': 'suv', 'description': 'Sport Utility Vehicles'},
  {'id': 'cat_2', 'name': 'Sedan', 'slug': 'sedan', 'description': 'Sedan cars'},
  {'id': 'cat_3', 'name': 'Coupe', 'slug': 'coupe', 'description': 'Coupe cars'},
  {'id': 'cat_4', 'name': 'Convertible', 'slug': 'convertible', 'description': 'Convertible cars'},
];

Map<String, dynamic> _listingImage(String id, String listingId, String url, {bool primary = false}) => {
  'id': id,
  'listing_id': listingId,
  'image_url': url,
  'is_primary': primary,
  'sort_order': primary ? 0 : 1,
};

final mockListings = [
  {
    'id': 'listing_1',
    'seller_id': 'user_1',
    'make_id': 'make_2',
    'model_id': 'model_3',
    'category_id': 'cat_1',
    'year': 2023,
    'price': 850000.0,
    'original_price': 920000.0,
    'mileage': 15000,
    'fuel_type': 'Petrol',
    'transmission': 'Automatic',
    'engine_size': '4.0L V8',
    'color': 'Obsidian Black',
    'interior_color': 'Black Nappa Leather',
    'condition': 'Excellent',
    'number_of_owners': 1,
    'vin': 'W1K9H8AB5N1234567',
    'license_plate': 'DXB-12345',
    'description': 'Mercedes-Benz G63 AMG in pristine condition. Full service history at Al Futtaim. Factory options include Night Package, AMG Performance exhaust, and carbon fiber interior trim. Never off-roaded, always garaged.',
    'location': 'Dubai Marina, Dubai',
    'views_count': 1456,
    'status': 'in_stock',
    'total': 1,
    'expires_at': '2026-07-15T00:00:00Z',
    'order_date': null,
    'expected_arrival': null,
    'actual_arrival': null,
    'seller': mockUserJson,
    'make': mockMakes[1],
    'model': mockModels[2],
    'images': [
      _listingImage('img_1a', 'listing_1', 'https://images.unsplash.com/photo-1632245889029-e668f0d38bf1?w=800', primary: true),
      _listingImage('img_1b', 'listing_1', 'https://images.unsplash.com/photo-1632245889029-e668f0d38bf1?w=800'),
    ],
    'primary_image': _listingImage('img_1a', 'listing_1', 'https://images.unsplash.com/photo-1632245889029-e668f0d38bf1?w=800', primary: true),
    'features': [mockFeatures[0], mockFeatures[1], mockFeatures[3], mockFeatures[4], mockFeatures[9]],
  },
  {
    'id': 'listing_2',
    'seller_id': 'user_1',
    'make_id': 'make_1',
    'model_id': 'model_1',
    'category_id': 'cat_1',
    'year': 2024,
    'price': 320000.0,
    'original_price': null,
    'mileage': 5000,
    'fuel_type': 'Petrol',
    'transmission': 'Automatic',
    'engine_size': '3.5L V6',
    'color': 'Pearl White',
    'interior_color': 'Beige Leather',
    'condition': 'New',
    'number_of_owners': 0,
    'vin': 'JTMCU8AJ6R1234567',
    'license_plate': 'AD-54321',
    'description': 'Brand new Toyota Land Cruiser VXR. Full factory warranty until 2028. Equipped with all options including rear entertainment, cool box, and adaptive suspension.',
    'location': 'Al Reem Island, Abu Dhabi',
    'views_count': 2340,
    'status': 'in_stock',
    'total': 2,
    'expires_at': '2026-08-01T00:00:00Z',
    'order_date': null,
    'expected_arrival': null,
    'actual_arrival': null,
    'seller': mockUserJson,
    'make': mockMakes[0],
    'model': mockModels[0],
    'images': [
      _listingImage('img_2a', 'listing_2', 'https://images.unsplash.com/photo-1552519507-da3b142c6e3d?w=800', primary: true),
      _listingImage('img_2b', 'listing_2', 'https://images.unsplash.com/photo-1552519507-da3b142c6e3d?w=800'),
    ],
    'primary_image': _listingImage('img_2a', 'listing_2', 'https://images.unsplash.com/photo-1552519507-da3b142c6e3d?w=800', primary: true),
    'features': [mockFeatures[0], mockFeatures[2], mockFeatures[5], mockFeatures[7]],
  },
  {
    'id': 'listing_3',
    'seller_id': 'user_2',
    'make_id': 'make_3',
    'model_id': 'model_5',
    'category_id': 'cat_1',
    'year': 2022,
    'price': 285000.0,
    'original_price': 310000.0,
    'mileage': 35000,
    'fuel_type': 'Diesel',
    'transmission': 'Automatic',
    'engine_size': '3.0L V6',
    'color': 'Mineral White',
    'interior_color': 'Cognac Sensafin',
    'condition': 'Very Good',
    'number_of_owners': 1,
    'vin': 'WBALS0102P1234567',
    'license_plate': 'SHJ-9876',
    'description': 'BMW X5 xDrive40d M Sport package. Adaptive LED headlights, Harman Kardon sound system, panoramic roof. GCC specs, clean title.',
    'location': 'Al Majaz, Sharjah',
    'views_count': 892,
    'status': 'in_stock',
    'total': 1,
    'expires_at': '2026-06-20T00:00:00Z',
    'order_date': null,
    'expected_arrival': null,
    'actual_arrival': null,
    'seller': mockUser2Json,
    'make': mockMakes[2],
    'model': mockModels[4],
    'images': [
      _listingImage('img_3a', 'listing_3', 'https://images.unsplash.com/photo-1555215695-3004980ad54e?w=800', primary: true),
      _listingImage('img_3b', 'listing_3', 'https://images.unsplash.com/photo-1555215695-3004980ad54e?w=800'),
    ],
    'primary_image': _listingImage('img_3a', 'listing_3', 'https://images.unsplash.com/photo-1555215695-3004980ad54e?w=800', primary: true),
    'features': [mockFeatures[2], mockFeatures[5], mockFeatures[6], mockFeatures[8], mockFeatures[9]],
  },
  {
    'id': 'listing_4',
    'seller_id': 'user_1',
    'make_id': 'make_4',
    'model_id': 'model_7',
    'category_id': 'cat_1',
    'year': 2025,
    'price': 415000.0,
    'original_price': null,
    'mileage': 1200,
    'fuel_type': 'Petrol',
    'transmission': 'Automatic',
    'engine_size': '5.6L V8',
    'color': 'Pearl White',
    'interior_color': 'Beige Leather',
    'condition': 'New',
    'number_of_owners': 0,
    'vin': 'JN8AY2NC0R1234567',
    'license_plate': 'DXB-78901',
    'description': 'Nissan Patrol Super Safari 2025 model. Brand new with zero kilometers. GCC specs with full 5-year warranty. Includes rear seat entertainment, premium audio, and chrome package.',
    'location': 'Al Barsha, Dubai',
    'views_count': 3100,
    'status': 'in_stock',
    'total': 3,
    'expires_at': '2026-09-01T00:00:00Z',
    'order_date': null,
    'expected_arrival': null,
    'actual_arrival': null,
    'seller': mockUserJson,
    'make': mockMakes[3],
    'model': mockModels[6],
    'images': [
      _listingImage('img_4a', 'listing_4', 'https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?w=800', primary: true),
      _listingImage('img_4b', 'listing_4', 'https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?w=800'),
    ],
    'primary_image': _listingImage('img_4a', 'listing_4', 'https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?w=800', primary: true),
    'features': [mockFeatures[0], mockFeatures[1], mockFeatures[2], mockFeatures[4], mockFeatures[5], mockFeatures[8]],
  },
  {
    'id': 'listing_5',
    'seller_id': 'user_2',
    'make_id': 'make_1',
    'model_id': 'model_2',
    'category_id': 'cat_2',
    'year': 2021,
    'price': 85000.0,
    'original_price': 105000.0,
    'mileage': 62000,
    'fuel_type': 'Petrol',
    'transmission': 'Automatic',
    'engine_size': '2.5L 4-cyl',
    'color': 'Silver Metallic',
    'interior_color': 'Black Fabric',
    'condition': 'Good',
    'number_of_owners': 2,
    'vin': '4T1B12BK6MU123456',
    'license_plate': 'AJ-4567',
    'description': 'Toyota Camry LE, well maintained with full service records. Ideal first car or daily driver. Clean interior, AC blows cold, new tires fitted last month.',
    'location': 'Al Ain, Abu Dhabi',
    'views_count': 567,
    'status': 'in_stock',
    'total': 1,
    'expires_at': '2026-06-10T00:00:00Z',
    'order_date': null,
    'expected_arrival': null,
    'actual_arrival': null,
    'seller': mockUser2Json,
    'make': mockMakes[0],
    'model': mockModels[1],
    'images': [
      _listingImage('img_5a', 'listing_5', 'https://images.unsplash.com/photo-1621007947382-bb3c3994e3fb?w=800', primary: true),
      _listingImage('img_5b', 'listing_5', 'https://images.unsplash.com/photo-1621007947382-bb3c3994e3fb?w=800'),
    ],
    'primary_image': _listingImage('img_5a', 'listing_5', 'https://images.unsplash.com/photo-1621007947382-bb3c3994e3fb?w=800', primary: true),
    'features': [mockFeatures[2], mockFeatures[4]],
  },
];

final mockInquiries = [
  {
    'id': 'inq_1',
    'listing_id': 'listing_1',
    'buyer_id': 'user_2',
    'seller_id': 'user_1',
    'message': 'Assalamu Alaikum, is the G63 still available? I am seriously interested and would like to schedule a viewing this weekend.',
    'phone_number': '+971-55-987-6543',
    'preferred_contact': 'WhatsApp',
    'status': 'new',
    'sent_at': '2026-05-23T18:30:00Z',
    'buyer': mockUser2Json,
    'seller': mockUserJson,
    'listing': mockListings[0],
  },
  {
    'id': 'inq_2',
    'listing_id': 'listing_2',
    'buyer_id': 'user_2',
    'seller_id': 'user_1',
    'message': 'Is the Land Cruiser available for test drive? I am in Abu Dhabi and can come this week.',
    'phone_number': '+971-55-987-6543',
    'preferred_contact': 'Phone',
    'status': 'read',
    'sent_at': '2026-05-22T10:15:00Z',
    'buyer': mockUser2Json,
    'seller': mockUserJson,
    'listing': mockListings[1],
  },
];

final mockOffers = [
  {
    'id': 'offer_1',
    'listing_id': 'listing_1',
    'buyer_id': 'user_2',
    'seller_id': 'user_1',
    'offered_price': 800000.0,
    'message': 'I can do 800k cash today. Let me know.',
    'status': 'pending',
    'expires_at': '2026-05-30T00:00:00Z',
    'buyer': mockUser2Json,
    'seller': mockUserJson,
    'listing': mockListings[0],
  },
  {
    'id': 'offer_2',
    'listing_id': 'listing_3',
    'buyer_id': 'user_1',
    'seller_id': 'user_2',
    'offered_price': 270000.0,
    'message': 'Would you consider 270k? I can arrange inspection anytime.',
    'status': 'countered',
    'expires_at': '2026-05-28T00:00:00Z',
    'buyer': mockUserJson,
    'seller': mockUser2Json,
    'listing': mockListings[2],
  },
];

final mockOrders = [
  {
    'id': 'order_1',
    'buyer_id': 'user_2',
    'seller_id': 'user_1',
    'order_number': 'ORD-2026-0001',
    'status': 'completed',
    'subtotal': 850000.0,
    'tax': 42500.0,
    'fees': 5000.0,
    'total': 897500.0,
    'notes': 'Delivery arranged for March 15th.',
    'placed_at': '2026-03-01T10:00:00Z',
    'completed_at': '2026-03-15T14:00:00Z',
    'buyer': mockUser2Json,
    'seller': mockUserJson,
    'items': [
      {'id': 'item_1', 'order_id': 'order_1', 'listing_id': 'listing_1', 'offer_id': null, 'price': 850000.0, 'condition': 'Excellent', 'listing': mockListings[0]},
    ],
    'transactions': [
      {'id': 'txn_1', 'order_id': 'order_1', 'type': 'sale', 'method': 'bank_transfer', 'reference': 'TRF-2026-001', 'amount': 897500.0, 'status': 'completed', 'notes': 'Full payment received', 'processed_at': '2026-03-10T09:00:00Z'},
    ],
  },
  {
    'id': 'order_2',
    'buyer_id': 'user_1',
    'seller_id': 'user_2',
    'order_number': 'ORD-2026-0002',
    'status': 'processing',
    'subtotal': 285000.0,
    'tax': null,
    'fees': 2500.0,
    'total': 287500.0,
    'notes': 'Awaiting shipping confirmation.',
    'placed_at': '2026-05-20T16:00:00Z',
    'completed_at': null,
    'buyer': mockUserJson,
    'seller': mockUser2Json,
    'items': [
      {'id': 'item_2', 'order_id': 'order_2', 'listing_id': 'listing_3', 'offer_id': null, 'price': 285000.0, 'condition': 'Very Good', 'listing': mockListings[2]},
    ],
    'transactions': [
      {'id': 'txn_2', 'order_id': 'order_2', 'type': 'deposit', 'method': 'card', 'reference': 'CC-2026-002', 'amount': 50000.0, 'status': 'completed', 'notes': 'Deposit paid', 'processed_at': '2026-05-20T16:30:00Z'},
    ],
  },
];

final mockConversations = [
  {
    'id': 'conv_1',
    'sender_id': 'user_2',
    'receiver_id': 'user_1',
    'listing_id': 'listing_1',
    'subject': 'Mercedes-Benz G63 AMG inquiry',
    'last_message_at': '2026-05-23T19:00:00Z',
    'sender': mockUser2Json,
    'receiver': mockUserJson,
    'last_message': {
      'id': 'msg_3',
      'conversation_id': 'conv_1',
      'sender_id': 'user_1',
      'content': 'Yes it is still available. You can come Saturday morning if you like.',
      'read_at': null,
      'edited_at': null,
      'created_at': '2026-05-23T19:00:00Z',
    },
    'unread_count': 1,
  },
  {
    'id': 'conv_2',
    'sender_id': 'user_1',
    'receiver_id': 'user_2',
    'listing_id': 'listing_3',
    'subject': 'BMW X5 price negotiation',
    'last_message_at': '2026-05-22T15:00:00Z',
    'sender': mockUserJson,
    'receiver': mockUser2Json,
    'last_message': {
      'id': 'msg_6',
      'conversation_id': 'conv_2',
      'sender_id': 'user_2',
      'content': 'I can do 278k but that is my final offer.',
      'read_at': '2026-05-22T15:30:00Z',
      'edited_at': null,
      'created_at': '2026-05-22T15:00:00Z',
    },
    'unread_count': 0,
  },
];

final mockMessages = [
  {
    'id': 'msg_1',
    'conversation_id': 'conv_1',
    'sender_id': 'user_2',
    'content': 'Assalamu Alaikum, is the G63 still available?',
    'read_at': '2026-05-23T18:35:00Z',
    'edited_at': null,
    'created_at': '2026-05-23T18:30:00Z',
  },
  {
    'id': 'msg_2',
    'conversation_id': 'conv_1',
    'sender_id': 'user_2',
    'content': 'I am seriously interested and would like to schedule a viewing.',
    'read_at': '2026-05-23T18:35:00Z',
    'edited_at': null,
    'created_at': '2026-05-23T18:31:00Z',
  },
  {
    'id': 'msg_3',
    'conversation_id': 'conv_1',
    'sender_id': 'user_1',
    'content': 'Yes it is still available. You can come Saturday morning if you like.',
    'read_at': null,
    'edited_at': null,
    'created_at': '2026-05-23T19:00:00Z',
  },
  {
    'id': 'msg_4',
    'conversation_id': 'conv_2',
    'sender_id': 'user_1',
    'content': 'Hello, I am interested in your X5. Would you consider 270k?',
    'read_at': '2026-05-22T12:00:00Z',
    'edited_at': null,
    'created_at': '2026-05-22T11:30:00Z',
  },
  {
    'id': 'msg_5',
    'conversation_id': 'conv_2',
    'sender_id': 'user_2',
    'content': 'That is a bit low. I was thinking closer to 280k.',
    'read_at': '2026-05-22T12:30:00Z',
    'edited_at': null,
    'created_at': '2026-05-22T12:00:00Z',
  },
  {
    'id': 'msg_6',
    'conversation_id': 'conv_2',
    'sender_id': 'user_2',
    'content': 'I can do 278k but that is my final offer.',
    'read_at': '2026-05-22T15:30:00Z',
    'edited_at': null,
    'created_at': '2026-05-22T15:00:00Z',
  },
];

final mockSavedListings = [
  {
    'id': 'saved_1',
    'user_id': 'user_1',
    'listing_id': 'listing_3',
    'saved_at': '2026-05-22T10:00:00Z',
    'listing': mockListings[2],
  },
  {
    'id': 'saved_2',
    'user_id': 'user_1',
    'listing_id': 'listing_4',
    'saved_at': '2026-05-23T08:00:00Z',
    'listing': mockListings[3],
  },
];

final mockPreOrders = [
  {
    'id': 'po_1',
    'listing_id': null,
    'make_id': 'make_1',
    'model_id': 'model_1',
    'customer_id': 'user_3',
    'customer_name': 'Khalid Al Shamsi',
    'customer_email': 'khalid@example.com',
    'customer_phone': '+971-54-321-0987',
    'quantity': 1,
    'color': 'White',
    'interior_color': 'Beige',
    'trim_level': 'VXR',
    'engine_preference': 'V6',
    'transmission_preference': 'Automatic',
    'drivetrain_preference': '4WD',
    'fuel_type': 'Petrol',
    'year_min': 2025,
    'year_max': 2026,
    'mileage_max': 100,
    'total_price': 320000.0,
    'budget_min': 300000.0,
    'budget_max': 350000.0,
    'source': 'Website',
    'preferred_contact': 'Phone',
    'status': 'deposit_paid',
    'notes': 'Customer wants white exterior with beige interior.',
    'internal_notes': 'Contacted Toyota Al Futtaim for allocation.',
    'special_requests': 'Requested floor mats and tint.',
    'created_by': 'user_1',
    'customer': {
      'id': 'user_3',
      'email': 'khalid@example.com',
      'full_name': 'Khalid Al Shamsi',
      'phone': '+971-54-321-0987',
      'is_verified': false,
      'is_dealer': false,
      'location': 'Dubai, UAE',
    },
    'listing': null,
    'make': mockMakes[0],
    'model': mockModels[0],
    'payments': [
      {
        'id': 'pay_1',
        'pre_order_id': 'po_1',
        'amount': 50000.0,
        'payment_type': 'deposit',
        'payment_method': 'bank_transfer',
        'reference': 'PO-DEP-001',
        'payment_date': '2026-05-15T09:00:00Z',
        'status': 'completed',
        'notes': 'Initial deposit received.',
      },
    ],
  },
];

final mockDashboardStats = {
  'total_listings': 5,
  'active_listings': 4,
  'total_orders': 2,
  'pending_orders': 1,
  'total_revenue': 1185000.0,
  'total_inquiries': 2,
  'unread_inquiries': 1,
  'total_offers': 2,
  'pending_offers': 1,
  'total_users': 3,
  'total_sellers': 2,
  'total_buyers': 2,
  'total_pre_orders': 1,
};

final mockUsers = [
  mockUserJson,
  mockUser2Json,
  {
    'id': 'user_3',
    'email': 'khalid@example.com',
    'full_name': 'Khalid Al Shamsi',
    'phone': '+971-54-321-0987',
    'avatar_url': null,
    'is_verified': false,
    'is_dealer': false,
    'location': 'Dubai, UAE',
    'join_date': '2026-01-05T12:00:00Z',
    'last_active': '2026-05-24T07:00:00Z',
    'roles': ['user'],
  },
];

Map<String, Map<String, dynamic>> _responses = {};

Map<String, dynamic> _r(String path, Map<String, dynamic> data) {
  _responses[path] = data;
  return data;
}

Map<String, dynamic> mockResponseFor(String method, String path, {Map<String, dynamic>? body}) {
  final idMatch = RegExp(r'^/listings/(.+)$').firstMatch(path);
  final idMatch2 = RegExp(r'^/inquiries/(.+)$').firstMatch(path);
  final idMatch3 = RegExp(r'^/offers/(.+)$').firstMatch(path);
  final idMatch4 = RegExp(r'^/orders/(.+)$').firstMatch(path);
  final idMatch5 = RegExp(r'^/pre-orders/(.+)$').firstMatch(path);
  final savedMatch = RegExp(r'^/saved/(.+)$').firstMatch(path);

  if (path == '/auth/login' || path == '/auth/register') {
    return _r(path, {'token': 'mock_token_abc123', 'user': mockUserJson});
  }
  if (path == '/auth/me') {
    return _r(path, {'user': mockUserJson});
  }
  if (path == '/auth/logout' || path == '/auth/refresh') {
    return _r(path, {'message': 'Success'});
  }

  if (path == '/listings') {
    final filtered = mockListings.where((l) {
      if (body == null) return true;
      if (body['make_id'] != null && l['make_id'] != body['make_id']) return false;
      if (body['model_id'] != null && l['model_id'] != body['model_id']) return false;
      if (body['category_id'] != null && l['category_id'] != body['category_id']) return false;
      if (body['status'] != null && l['status'] != body['status']) return false;
      if (body['year_min'] != null && (l['year'] as int) < (body['year_min'] as int)) return false;
      if (body['year_max'] != null && (l['year'] as int) > (body['year_max'] as int)) return false;
      if (body['price_min'] != null && (l['price'] as num) < (body['price_min'] as num)) return false;
      if (body['price_max'] != null && (l['price'] as num) > (body['price_max'] as num)) return false;
      return true;
    }).toList();
    return _r(path, {'data': filtered, 'listings': filtered});
  }

  if (idMatch != null) {
    final id = idMatch.group(1);
    final idx = mockListings.indexWhere((l) => l['id'] == id);
    if (idx >= 0 && method == 'PUT' && body != null) {
      mockListings[idx] = {...mockListings[idx], ...body};
      return _r(path, {'data': mockListings[idx], 'listing': mockListings[idx]});
    }
    if (idx >= 0 && method == 'DELETE') {
      mockListings.removeAt(idx);
      return _r(path, {'message': 'Deleted successfully'});
    }
    final listing = idx >= 0 ? mockListings[idx] : null;
    return _r(path, {'data': listing, 'listing': listing});
  }

  if (path == '/listings' && method == 'POST' && body != null) {
    final newListing = Map<String, dynamic>.from(body);
    newListing['id'] = 'listing_new_${mockListings.length + 1}';
    newListing['seller'] = mockUserJson;
    newListing['images'] = [];
    newListing['features'] = [];
    newListing['views_count'] = 0;
    newListing['status'] = 'in_stock';
    (mockListings as List).insert(0, newListing);
    return _r(path, {'data': newListing, 'listing': newListing});
  }

  if (path == '/makes') {
    return _r(path, {'data': mockMakes, 'makes': mockMakes});
  }

  if (path == '/inquiries') {
    if (method == 'GET') return _r(path, {'data': mockInquiries, 'inquiries': mockInquiries});
    if (method == 'POST' && body != null) {
      final newInq = Map<String, dynamic>.from(body);
      newInq['id'] = 'inq_new_${mockInquiries.length + 1}';
      newInq['status'] = 'new';
      newInq['sent_at'] = DateTime.now().toIso8601String();
      (mockInquiries as List).insert(0, newInq);
      return _r(path, {'data': newInq, 'inquiry': newInq});
    }
  }
  if (idMatch2 != null) {
    final id = idMatch2.group(1);
    final inq = mockInquiries.where((i) => i['id'] == id).firstOrNull;
    return _r(path, {'data': inq, 'inquiry': inq});
  }

  if (path == '/offers') {
    if (method == 'GET') return _r(path, {'data': mockOffers, 'offers': mockOffers});
    if (method == 'POST' && body != null) {
      final newOffer = Map<String, dynamic>.from(body);
      newOffer['id'] = 'offer_new_${mockOffers.length + 1}';
      newOffer['status'] = 'pending';
      (mockOffers as List).insert(0, newOffer);
      return _r(path, {'data': newOffer, 'offer': newOffer});
    }
  }
  if (idMatch3 != null) {
    final id = idMatch3.group(1);
    final offer = mockOffers.where((o) => o['id'] == id).firstOrNull;
    if (path.endsWith('/accept') && offer != null) {
      offer['status'] = 'accepted';
      return _r(path, {'data': offer, 'offer': offer});
    }
    if (path.endsWith('/reject') && offer != null) {
      offer['status'] = 'rejected';
      return _r(path, {'data': offer, 'offer': offer});
    }
    if (path.endsWith('/counter') && method == 'POST' && offer != null) {
      offer['status'] = 'countered';
      offer['offered_price'] = body?['offered_price'] ?? offer['offered_price'];
      return _r(path, {'data': offer, 'offer': offer});
    }
    return _r(path, {'data': offer, 'offer': offer});
  }

  if (path == '/orders') {
    return _r(path, {'data': mockOrders, 'orders': mockOrders});
  }
  if (idMatch4 != null) {
    final id = idMatch4.group(1);
    final order = mockOrders.where((o) => o['id'] == id).firstOrNull;
    return _r(path, {'data': order, 'order': order});
  }

  if (path == '/conversations') {
    return _r(path, {'data': mockConversations, 'conversations': mockConversations});
  }
  final convMsgMatch = RegExp(r'^/conversations/(.+)/messages$').firstMatch(path);
  if (convMsgMatch != null) {
    return _r(path, {'data': mockMessages, 'messages': mockMessages});
  }
  final convReadMatch = RegExp(r'^/conversations/(.+)/read$').firstMatch(path);
  if (convReadMatch != null) {
    return _r(path, {'success': true});
  }
  final convMatch = RegExp(r'^/conversations/(.+)$').firstMatch(path);
  if (convMatch != null) {
    return _r(path, {'success': true});
  }

  final convReplyMatch = RegExp(r'^/conversations/(.+)/reply$').firstMatch(path);
  if (convReplyMatch != null && method == 'POST') {
    final newMsg = {
      'id': 'msg_new_${mockMessages.length + 1}',
      'conversation_id': convReplyMatch.group(1),
      'sender_id': 'user_1',
      'content': body?['content'] ?? '',
      'read_at': null,
      'edited_at': null,
      'created_at': DateTime.now().toIso8601String(),
    };
    (mockMessages as List).add(newMsg);
    return _r(path, {'data': newMsg, 'message': newMsg});
  }

  if (path == '/messages/send' && method == 'POST') {
    final newMsg = {
      'id': 'msg_new_${mockMessages.length + 1}',
      'conversation_id': body?['conversation_id'] ?? '',
      'sender_id': body?['sender_id'] ?? 'user_1',
      'content': body?['content'] ?? '',
      'read_at': null,
      'edited_at': null,
      'created_at': DateTime.now().toIso8601String(),
    };
    (mockMessages as List).add(newMsg);
    return _r(path, {'data': newMsg, 'message': newMsg});
  }

  if (path == '/pre-orders') {
    if (method == 'GET') return _r(path, {'data': mockPreOrders, 'pre_orders': mockPreOrders});
    if (method == 'POST' && body != null) {
      final newPo = Map<String, dynamic>.from(body);
      newPo['id'] = 'po_new_${mockPreOrders.length + 1}';
      newPo['status'] = 'pending';
      newPo['payments'] = [];
      (mockPreOrders as List).insert(0, newPo);
      return _r(path, {'data': newPo, 'pre_order': newPo});
    }
  }
  if (idMatch5 != null) {
    final id = idMatch5.group(1);
    final po = mockPreOrders.where((p) => p['id'] == id).firstOrNull;
    return _r(path, {'data': po, 'pre_order': po});
  }

  if (path == '/saved') {
    return _r(path, {'data': mockSavedListings, 'saved': mockSavedListings});
  }
  if (savedMatch != null) {
    return _r(path, {'success': true});
  }

  if (path == '/admin/dashboard/stats') {
    return _r(path, {'data': mockDashboardStats, 'stats': mockDashboardStats});
  }
  if (path == '/admin/users') {
    return _r(path, {'data': mockUsers, 'users': mockUsers});
  }
  if (path == '/admin/listings') {
    return _r(path, {'data': mockListings, 'listings': mockListings});
  }
  if (path == '/admin/makes') {
    return _r(path, {'data': mockMakes, 'makes': mockMakes});
  }
  if (path == '/admin/categories') {
    return _r(path, {'data': mockCategories, 'categories': mockCategories});
  }
  if (path == '/admin/orders') {
    return _r(path, {'data': mockOrders, 'orders': mockOrders});
  }

  return _r(path, {'message': 'Mock: $method $path not implemented'});
}
