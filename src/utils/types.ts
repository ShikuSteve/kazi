export type PaymentMode = "APP" | "OTHER";

export type Duration =
  | "LESS_THAN_A_WEEK"
  | "LESS_THAN_2_WEEKS"
  | "ABOUT_A_MONTH"
  | "MORE_THAN_A_MONTH"
  | "NOT_SURE_STILL_PLANNING_AND_BUDGETING";
export type ProfileType = "PROVIDER" | "CONSUMER";

interface Audit {
  initiator: string;
  ip: string;
}
export interface ServiceConsumerData extends Audit {
  serviceConsumerId: string;
  firstName: string;
  lastName: string;
  email: string;
  phoneNum: string;
  imageUrl: string;
}

export interface WorkOrderData extends Audit {
  workOrderId: string;
  description: string;
  personnel: number;
  location: { lat: number; lng: number };
  paymentMode: PaymentMode;
  duration: Duration;
  startDate: string;
  endDate: string;
  serviceConsumerId: string;
  email: string;
}

export interface Rate {
  rateId: string;
  amount: number;
  currency: string;
  frequency: string;
  serviceProviderId: string;
}

export interface ServiceProviderData extends Audit {
  serviceProviderId: string;
  firstName: string;
  latName: string;
  email: string;
  professionType: string;
  description: string;
  profileName: string;
  phoneNum: string;
  imageUrl: string;
  location: { lat: number; lng: number };
  paymentMode: PaymentMode;
  rate: Rate;
  workSample?: WorkSample;
  schedule?: Schedule;
}

export interface WorkSample extends Audit, ServiceProviderData {
  workSampleId: string;
  title: string;
  description: string;
  imageUrls: string;
}

export interface Schedule extends Audit {
  date: string;
  serviceProviderId: string;
  scheduleId: string;
  email: string;
}

export interface Contract extends Audit {
  contractId: string;
  location: { lat: number; lng: number };
  paymentMode: PaymentMode;
  duration: Duration;
  startDate: string;
  endDate: string;
  serviceProviderSignDate: string;
  serviceConsumerSignDate: string;
  serviceConsumer: ServiceConsumerData;
  serviceProvider: ServiceProviderData; //Use reverse relation to fetch them instead of giving them as objects.
}

export interface Rating extends Audit {
  ratingId: string;
  contractId: string;
  email: string;
  score: number;
  comments: string;
  imageUrls: string;
  profileType: ProfileType;
}

export interface ServiceProviderRating extends Rating {
  serviceProviderId: string;
}

export interface ServiceConsumerRating extends Rating {
  serviceConsumerId: string;
}

export interface Payment extends Audit {
  date: string;
  transactionId: number;
  paymentMode: PaymentMode;
  contractId: string;
  email: string;
}

export interface Favorite extends Audit {
  favoriteId: string;
  contractId: string;
  profileType: ProfileType;
  email: string;
  action: "add" | "remove";
}
