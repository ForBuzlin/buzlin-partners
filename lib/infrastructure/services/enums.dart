enum OrderStatus {
  newOrder,
  accepted,
  ready,
  onAWay,
  pause,
  delivered,
  canceled,
}

enum BookingStatus {
  newOrder,
  booked,
  progress,
  ended,
  canceled,
}

enum CalendarType { day, threeDay, week, list }

enum ExtrasType { color, text, image }

enum LayoutType {
  twoV,
  twoH,
  threeH,
  threeV,
}

enum DeliveryType { delivery, pickup }

enum UploadType {
  chats,
  extras,
  brands,
  categories,
  shopsLogo,
  shopsBack,
  products,
  reviews,
  users,
  stocks,
  discounts,
}

enum ProductStatus { published, pending, unpublished }

enum CategoryStatus { published, pending, unpublished }

enum WeekDays {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

enum MinuteSlotSize {
  minutes5,
  minutes15,
  minutes30,
  minutes60,
}

enum LineStyle {
  solid,
  dashed,
}
