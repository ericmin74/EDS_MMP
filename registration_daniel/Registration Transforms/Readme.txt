Registrations done in MATLAB 2025 registration estimator

SURF features, rigid transformations, no rotation
Maximize number of features, then set quality to a high enough threshold that only reasonable feature matches apply

Low intensity images that don't automatically register are amplified and matched to a similar image, then registered the same way as that similar image.
- For example, BP image is very dark. BP is scaled up to have visible features and compared to RP, HP, and VP images to determine best fit. Lets say RP is the best fit. BP will then use the same registration transformation as RP.
- Most often (with several exceptions), BP matched to RP, HV matched to VV, VH matched to HH, and RL matched to BL.