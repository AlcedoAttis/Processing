/**
 * Creates a complex number of the form a+bi
 **/
class c {
  float real;
  float imaginary;

  // constructs two numbers
  // the first takes the part of the real number, the other of the imaginary number
  c(float a, float b) {
    this.real=a;
    this.imaginary=b;
  }

  // returns the imaginary part of the complex number
  float i() {
    return imaginary;
  }

  // returns the real part of the complex number
  float r() {
    return real;
  }

  // returns the complex conjugate of the complex number
  c conjugate() {
    return new c(real, -imaginary);
  }

  // returns the sum of this comlex number and a given complex number
  c sum(c p) {
    float real_part = real+p.r();
    float imaginary_part = imaginary+p.i();
    return new c(real_part, imaginary_part);
  }

  // returns the product of this comlex number and a given complex number
  c product(c p) {
    float real_part = real*p.r() - imaginary*p.i();
    float imaginary_part = real*p.i() + imaginary*p.r();
    return new c(real_part, imaginary_part);
  }

  // returns the product of this complex number and the comlex conjugate of it
  // unused
  c complex_conjugate_square() {
    return this.product(this.conjugate());
  }

  // returns the real part of the product of this complex number and the comlex conjugate of it
  // the return value is also the probability
  float float_complex_conjugate_square() {
    return this.complex_conjugate_square().r();
  }

  // prints this complex number
  String print() {
    return real+"+"+imaginary+"i ";
  }

  // sets the complex number on request
  // unused
  void update(float a, float b) {
    real=a;
    imaginary=b;
  }
}