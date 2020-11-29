library xpx_chain_sdk.cons;

enum MultisigCosignatoryModificationType { add, remove }

const add = MultisigCosignatoryModificationType.add,
    remove = MultisigCosignatoryModificationType.remove;

const addressSize = 25,
    numChecksumBytes = 4,
    addressEncodeSize = 40,
    amountSize = 8,
    addressDecodeSize = 25,
    keySize = 32,
    privateKeySize = 64,
    publicKeySize = 64,
    hash256 = 32,
    mosaicIdSize = 8,
    namespaceSize = 8,
    sizeSize = 4,
    signerSize = keySize,
    signatureSize = 64,
    versionSize = 4,
    typeSize = 2,
    maxFeeSize = 8,
    deadLineSize = 8,
    durationSize = 8,
    transactionHeaderSize = sizeSize +
        signerSize +
        signatureSize +
        versionSize +
        typeSize +
        maxFeeSize +
        deadLineSize,
    propertyTypeSize = 2,
    propertyModificationTypeSize = 1,
    accountPropertiesAddressModificationSize =
        propertyModificationTypeSize + addressDecodeSize,
    accountPropertiesMosaicModificationSize =
        propertyModificationTypeSize + mosaicIdSize,
    accountPropertiesEntityModificationSize =
        propertyModificationTypeSize + typeSize,
    accountPropertyAddressHeader = transactionHeaderSize + propertyTypeSize,
    accountPropertyMosaicHeader = transactionHeaderSize + propertyTypeSize,
    accountPropertyEntityTypeHeader = transactionHeaderSize + propertyTypeSize,
    linkActionSize = 1,
    accountLinkTransactionSize =
        transactionHeaderSize + keySize + linkActionSize,
    aliasActionSize = 1,
    aliasTransactionHeader =
        transactionHeaderSize + namespaceSize + aliasActionSize,
    aggregateBondedHeader = transactionHeaderSize + sizeSize,
    hashTypeSize = 1,
    lockSize = transactionHeaderSize +
        mosaicIdSize +
        amountSize +
        durationSize +
        hash256,
    metadataTypeSize = 1,
    metadataHeaderSize = transactionHeaderSize + metadataTypeSize,
    modificationsSizeSize = 1,
    modifyContractHeaderSize = transactionHeaderSize +
        durationSize +
        hash256 +
        3 * modificationsSizeSize,
    minApprovalSize = 1,
    minRemovalSize = 1,
    modifyMultisigHeaderSize = transactionHeaderSize +
        minApprovalSize +
        minRemovalSize +
        modificationsSizeSize,
    mosaicNonceSize = 4,
    mosaicPropertySize = 4,
    mosaicPropertiesHeaderSize = 3,
    mosaicDefinitionTransactionHeaderSize = transactionHeaderSize +
        mosaicNonceSize +
        mosaicIdSize +
        mosaicPropertiesHeaderSize,
    mosaicSupplyDirectionSize = 1,
    mosaicSupplyChangeTransactionSize = transactionHeaderSize +
        mosaicIdSize +
        amountSize +
        mosaicSupplyDirectionSize,
    namespaceTypeSize = 1,
    namespaceNameSizeSize = 1,
    registerNamespaceHeaderSize = transactionHeaderSize +
        namespaceTypeSize +
        durationSize +
        namespaceSize +
        namespaceNameSizeSize,
    secretLockSize = transactionHeaderSize +
        mosaicIdSize +
        amountSize +
        durationSize +
        hashTypeSize +
        hash256 +
        addressDecodeSize,
    proofSizeSize = 2,
    secretProofHeaderSize =
        transactionHeaderSize + hashTypeSize + hash256 + proofSizeSize,
    mosaicsSizeSize = 1,
    messageSizeSize = 2,
    transferHeaderSize = transactionHeaderSize +
        addressDecodeSize +
        mosaicsSizeSize +
        messageSizeSize,
    offerTypeSize = 1,
    offersCountSize = 1,
    addExchangeOfferSize =
        mosaicIdSize + durationSize + 2 * amountSize + offerTypeSize,
    addExchangeOfferHeaderSize = transactionHeaderSize + offersCountSize,
    exchangeOfferSize = durationSize + 2 * amountSize + offerTypeSize + keySize,
    exchangeOfferHeaderSize = transactionHeaderSize + offersCountSize,
    removeExchangeOfferSize = offerTypeSize + mosaicIdSize,
    removeExchangeOfferHeaderSize = transactionHeaderSize + offersCountSize;
