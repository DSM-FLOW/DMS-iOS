case "${CONFIGURATION}" in
    "DEV" )
        cp -r "$SRCROOT/Support/Firebase/GoogleService-Info-DEV.plist" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist" ;;
    "STAGE" )
        cp -r "$SRCROOT/Support/Firebase/GoogleService-Info-STAGE.plist" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist" ;;
    "PROD" )
        cp -r "$SRCROOT/Support/Firebase/GoogleService-Info-PROD.plist" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist" ;;
    *)
        ;;
esac
