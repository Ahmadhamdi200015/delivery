class MyCouponModel {
  int? CouponId;
  String? CouponName;
  int? CouponCount;
  int? CouponDiscount;
  String? CouponExpiredate;



  MyCouponModel(
      {this.CouponId,
        this.CouponName,
        this.CouponCount,
        this.CouponDiscount,
        this.CouponExpiredate,
      });

  MyCouponModel.fromJson(Map<String, dynamic> json) {
    CouponId = json['coupon_id'];
    CouponName = json['coupon_name'];
    CouponCount = json['coupon_count'];
    CouponDiscount = json['coupon_discount'];
    CouponExpiredate = json['coupon_expiredate'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coupon_id'] = this.CouponId;
    data['coupon_name'] = this.CouponName;
    data['coupon_count'] = this.CouponCount;
    data['coupon_discount'] = this.CouponDiscount;
    data['coupon_expiredate'] = this.CouponExpiredate;


    return data;
  }
}