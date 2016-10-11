!***************************************************************************
!****m* /besselK
! NAME
! module besselK
! PURPOSE
! provide the 'modified Bessel functions of second kind'
!
! basis are own expansion series
!***************************************************************************
module besselK
  implicit none
  private

!  public :: BesselK0
!  public :: BesselK1
  public :: BesselK2

contains

  !*************************************************************************
  !****f* besselK/BesselK2
  ! NAME
  ! real function BesselK2(x)
  ! PURPOSE
  ! return the value K(2,x)
  !*************************************************************************
  elemental real function BesselK2(x)
    real, intent(in) :: x

    real :: y

    if (x < 0.44) then

       ! Series[BesselK[2, x]*2*(x/2)^2, {x, 1/10, 9}] =
!!$       BesselK2 = 0.99999998758884929694 + &
!!$            x * (1.4892136801603491146d-6 + &
!!$            x * (-0.25008934162842756542 + &
!!$            x * (0.0041684058715656752899 + &
!!$            x * (0.21049316758849114140 + &
!!$            x * (-0.62421797839461600945 + &
!!$            x * (2.1000887419165511471 + &
!!$            x * (-5.9746366600001049684 + &
!!$            x * (11.189019209619583585 - &
!!$            x * 9.9414768221417825377))))))))

       ! Series[BesselK[2, x]*2*(x/2)^2, {x, 1/5, 9}] =
       BesselK2 = 0.99999980091985787511 + &
            x * (0.000011940788002489212022 + &
            x * (-0.25035804298208441926 + &
            x * (0.0083473238248482670447 + &
            x * (0.16705338866050425318 + &
            x * (-0.31093118196455923589 + &
            x * (0.53395486736857595826 + &
            x * (-0.75507491941677538261 + &
            x * (0.70480613170564228313 - &
            x * 0.31268356402903565353))))))))

       BesselK2 = BesselK2 * 0.5 * (2.0/x)**2

    else if (x<1.34) then

       ! Series[BesselK[2, x]*2*(x/2)^2, {x, 1, 9}] =
       BesselK2 = 0.99986361256925137822 + &
            x * (0.0016209157125327418600 + &
            x * (-0.25958659871125885366 + &
            x * (0.043686240767809798331 + &
            x * (0.062174646577794093296 + &
            x * (-0.053953379606858806411 + &
            x * (0.024851362272818755918 + &
            x * (-0.0075226077469203692121 + &
            x * (0.0014089807191940366083 - &
            x * 0.00012372323677403354727))))))))

       ! Series[BesselK[2, x]*2*(x/2)^2, {x, 1/2, 9}] =
!!$       BesselK2 = 0.99999207849365792759 + &
!!$            x * (0.00018969592632030041705 + &
!!$            x * (-0.25226885209937335113 + &
!!$            x * (0.021060603242251917135 + &
!!$            x * (0.10892742887327697815 + &
!!$            x * (-0.12099149021465389868 + &
!!$            x * (0.091510483358219150588 + &
!!$            x * (-0.051739553568875620601 + &
!!$            x * (0.019098908473891630580 - &
!!$            x * 0.0033619553079805505160))))))))

       BesselK2 = BesselK2 * 0.5 * (2.0/x)**2

    else

       y = 1/x

       ! Series[BesselK[2, 1/y]/(Exp[-1/y]/Sqrt[1/y]), {y, 1/2, 9}] =
       BesselK2 = 1.2532988981016748537 + &
            y * (2.3503020773744263558 + &
            y * (1.0246163646137891845 + &
            y * (-0.36299488301832749484 + &
            y * (0.29364618956349654660 + &
            y * (-0.26823662818422918677 + &
            y * (0.21307532549477373773 + &
            y * (-0.12597636471075362193 + &
            y * (0.047435454762977236474 - &
            y * 0.0084015106046136688421))))))))

       BesselK2 = BesselK2 * exp(-x)/sqrt(x)

    end if

  end function BesselK2

end module besselK
