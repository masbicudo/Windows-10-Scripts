/// <reference lib="dom" />

interface ActiveXObject {
    new (s: "Msxml2.DOMDocument.6.0"):  IXMLDOMDocument3;
}

// [Guid("2933bf95-7b36-11d2-b20e-00c04f983e60")]
interface DOMDocument
{
}

// [Guid("2933bf95-7b36-11d2-b20e-00c04f983e60")]
interface DOMDocument26
{
}

// [Guid("2933bf95-7b36-11d2-b20e-00c04f983e60")]
interface DOMDocument30
{
}

// [Guid("310afa62-0575-11d2-9ca9-0060b0ec3d39")]
interface DSOControl
{
}

// [Guid("310afa62-0575-11d2-9ca9-0060b0ec3d39")]
interface DSOControl26
{
}

// [Guid("310afa62-0575-11d2-9ca9-0060b0ec3d39")]
interface DSOControl30
{
}

// [Guid("2933bf95-7b36-11d2-b20e-00c04f983e60")]
interface FreeThreadedDOMDocument
{
}

// [Guid("2933bf95-7b36-11d2-b20e-00c04f983e60")]
interface FreeThreadedDOMDocument26
{
}

// [Guid("2933bf95-7b36-11d2-b20e-00c04f983e60")]
interface FreeThreadedDOMDocument30
{
}

// [Guid("310afa62-0575-11d2-9ca9-0060b0ec3d39")]
interface IDSOControl
{
   /* Properties */
   XMLDocument : IXMLDOMDocument;
   JavaDSOCompatible : number;
   readonly readyState : number;
}

// [Guid("f10d27cc-3ec0-415c-8ed8-77ab1c5e7262")]
interface IMXAttributes
{
   /* Methods */
   addAttribute(strURI : string, strLocalName : string, strQName : string, strType : string, strValue : string) : void;
   addAttributeFromIndex(varAtts, nIndex : number) : void;
   clear() : void;
   removeAttribute(nIndex : number) : void;
   setAttribute(nIndex : number, strURI : string, strLocalName : string, strQName : string, strType : string, strValue : string) : void;
   setAttributes(varAtts) : void;
   setLocalName(nIndex : number, strLocalName : string) : void;
   setQName(nIndex : number, strQName : string) : void;
   setType(nIndex : number, strType : string) : void;
   setURI(nIndex : number, strURI : string) : void;
   setValue(nIndex : number, strValue : string) : void;
}

// [Guid("c90352f6-643c-4fbc-bb23-e996eb2d51fd")]
interface IMXNamespaceManager
{
   /* Methods */
   putAllowOverride(fOverride : boolean) : void;
   getAllowOverride() : boolean;
   reset() : void;
   pushContext() : void;
   pushNodeContext(contextNode : IXMLDOMNode, fDeep : boolean) : void;
   popContext() : void;
   declarePrefix(prefix : string, namespaceURI : string) : void;
   getDeclaredPrefix(nIndex : number, /*[Out,In]*/ pwchPrefix : IntPtr<number> , /*[Out,In]*/ pcchPrefix : IntPtr<number> ) : void;
   getPrefix(pwszNamespaceURI : string, nIndex : number, /*[Out,In]*/ pwchPrefix : IntPtr<number> , /*[Out,In]*/ pcchPrefix : IntPtr<number> ) : void;
   getURI(pwchPrefix : string, pContextNode : IXMLDOMNode, /*[Out,In]*/ pwchUri : IntPtr<number> , /*[Out,In]*/ pcchUri : IntPtr<number> ) : void;
}

// [Guid("c90352f4-643c-4fbc-bb23-e996eb2d51fd")]
interface IMXNamespacePrefixes
{
   /* Methods */
   GetEnumerator() : IEnumerator;
   /* Properties */
   item(index : number) : string;
   readonly length : number;
}

// [Guid("808f4e35-8d5a-4fbe-8466-33a41279ed30")]
interface IMXReaderControl
{
   /* Methods */
   abort() : void;
   resume() : void;
   suspend() : void;
}

// [Guid("fa4bb38c-faf9-4cca-9302-d1dd0fe520db")]
interface IMXSchemaDeclHandler
{
   /* Methods */
   schemaElementDecl(oSchemaElement : ISchemaElement) : void;
}

// [Guid("4d7ff4ba-1565-4ea8-94e1-6e724a46f98d")]
interface IMXWriter
{
   /* Methods */
   flush() : void;
   /* Properties */
   output;
   encoding : string;
   byteOrderMark : boolean;
   indent : boolean;
   standalone : boolean;
   omitXMLDeclaration : boolean;
   version : string;
   disableOutputEscaping : boolean;
}

// [Guid("c90352f7-643c-4fbc-bb23-e996eb2d51fd")]
interface IMXXMLFilter
{
   /* Methods */
   getFeature(strName : string) : boolean;
   putFeature(strName : string, fValue : boolean) : void;
   getProperty(strName : string);
   putProperty(strName : string, varValue) : void;
   /* Properties */
   entityResolver;
   contentHandler;
   dtdHandler;
   errorHandler;
}

// [Guid("f078abe1-45d2-4832-91ea-4466ce2f25c9")]
interface ISAXAttributes
{
   /* Methods */
   getLength() : number;
   getURI(nIndex : number, /*[Out]*/ ppwchUri : IntPtr, /*[Out]*/ pcchUri : IntPtr<number> ) : void;
   getLocalName(nIndex : number, /*[Out]*/ ppwchLocalName : IntPtr, /*[Out]*/ pcchLocalName : IntPtr<number> ) : void;
   getQName(nIndex : number, /*[Out]*/ ppwchQName : IntPtr, /*[Out]*/ pcchQName : IntPtr<number> ) : void;
   getName(nIndex : number, /*[Out]*/ ppwchUri : IntPtr, /*[Out]*/ pcchUri : IntPtr<number> , /*[Out]*/ ppwchLocalName : IntPtr, /*[Out]*/ pcchLocalName : IntPtr<number> , /*[Out]*/ ppwchQName : IntPtr, /*[Out]*/ pcchQName : IntPtr<number> ) : void;
   getIndexFromName(pwchUri : IntPtr<number> , cchUri : number, pwchLocalName : IntPtr<number> , cchLocalName : number) : number;
   getIndexFromQName(pwchQName : IntPtr<number> , cchQName : number) : number;
   getType(nIndex : number, /*[Out]*/ ppwchType : IntPtr, /*[Out]*/ pcchType : IntPtr<number> ) : void;
   getTypeFromName(pwchUri : IntPtr<number> , cchUri : number, pwchLocalName : IntPtr<number> , cchLocalName : number, /*[Out]*/ ppwchType : IntPtr, /*[Out]*/ pcchType : IntPtr<number> ) : void;
   getTypeFromQName(pwchQName : IntPtr<number> , cchQName : number, /*[Out]*/ ppwchType : IntPtr, /*[Out]*/ pcchType : IntPtr<number> ) : void;
   getValue(nIndex : number, /*[Out]*/ ppwchValue : IntPtr, /*[Out]*/ pcchValue : IntPtr<number> ) : void;
   getValueFromName(pwchUri : IntPtr<number> , cchUri : number, pwchLocalName : IntPtr<number> , cchLocalName : number, /*[Out]*/ ppwchValue : IntPtr, /*[Out]*/ pcchValue : IntPtr<number> ) : void;
   getValueFromQName(pwchQName : IntPtr<number> , cchQName : number, /*[Out]*/ ppwchValue : IntPtr, /*[Out]*/ pcchValue : IntPtr<number> ) : void;
}

// [Guid("1545cdfa-9e4e-4497-a8a4-2bf7d0112c44")]
interface ISAXContentHandler
{
   /* Methods */
   putDocumentLocator(pLocator : ISAXLocator) : void;
   startDocument() : void;
   endDocument() : void;
   startPrefixMapping(pwchPrefix : IntPtr<number> , cchPrefix : number, pwchUri : IntPtr<number> , cchUri : number) : void;
   endPrefixMapping(pwchPrefix : IntPtr<number> , cchPrefix : number) : void;
   startElement(pwchNamespaceUri : IntPtr<number> , cchNamespaceUri : number, pwchLocalName : IntPtr<number> , cchLocalName : number, pwchQName : IntPtr<number> , cchQName : number, pAttributes : ISAXAttributes) : void;
   endElement(pwchNamespaceUri : IntPtr<number> , cchNamespaceUri : number, pwchLocalName : IntPtr<number> , cchLocalName : number, pwchQName : IntPtr<number> , cchQName : number) : void;
   characters(pwchChars : IntPtr<number> , cchChars : number) : void;
   ignorableWhitespace(pwchChars : IntPtr<number> , cchChars : number) : void;
   processingInstruction(pwchTarget : IntPtr<number> , cchTarget : number, pwchData : IntPtr<number> , cchData : number) : void;
   skippedEntity(pwchName : IntPtr<number> , cchName : number) : void;
}

// [Guid("862629ac-771a-47b2-8337-4e6843c1be90")]
interface ISAXDeclHandler
{
   /* Methods */
   elementDecl(pwchName : IntPtr<number> , cchName : number, pwchModel : IntPtr<number> , cchModel : number) : void;
   attributeDecl(pwchElementName : IntPtr<number> , cchElementName : number, pwchAttributeName : IntPtr<number> , cchAttributeName : number, pwchType : IntPtr<number> , cchType : number, pwchValueDefault : IntPtr<number> , cchValueDefault : number, pwchValue : IntPtr<number> , cchValue : number) : void;
   internalEntityDecl(pwchName : IntPtr<number> , cchName : number, pwchValue : IntPtr<number> , cchValue : number) : void;
   externalEntityDecl(pwchName : IntPtr<number> , cchName : number, pwchPublicId : IntPtr<number> , cchPublicId : number, pwchSystemId : IntPtr<number> , cchSystemId : number) : void;
}

// [Guid("e15c1baf-afb3-4d60-8c36-19a8c45defed")]
interface ISAXDTDHandler
{
   /* Methods */
   notationDecl(pwchName : IntPtr<number> , cchName : number, pwchPublicId : IntPtr<number> , cchPublicId : number, pwchSystemId : IntPtr<number> , cchSystemId : number) : void;
   unparsedEntityDecl(pwchName : IntPtr<number> , cchName : number, pwchPublicId : IntPtr<number> , cchPublicId : number, pwchSystemId : IntPtr<number> , cchSystemId : number, pwchNotationName : IntPtr<number> , cchNotationName : number) : void;
}

// [Guid("99bca7bd-e8c4-4d5f-a0cf-6d907901ff07")]
interface ISAXEntityResolver
{
   /* Methods */
   resolveEntity(pwchPublicId : IntPtr<number> , pwchSystemId : IntPtr<number> );
}

// [Guid("a60511c4-ccf5-479e-98a3-dc8dc545b7d0")]
interface ISAXErrorHandler
{
   /* Methods */
   error(pLocator : ISAXLocator, pwchErrorMessage : IntPtr<number> , hrErrorCode : number) : void;
   fatalError(pLocator : ISAXLocator, pwchErrorMessage : IntPtr<number> , hrErrorCode : number) : void;
   ignorableWarning(pLocator : ISAXLocator, pwchErrorMessage : IntPtr<number> , hrErrorCode : number) : void;
}

// [Guid("7f85d5f5-47a8-4497-bda5-84ba04819ea6")]
interface ISAXLexicalHandler
{
   /* Methods */
   startDTD(pwchName : IntPtr<number> , cchName : number, pwchPublicId : IntPtr<number> , cchPublicId : number, pwchSystemId : IntPtr<number> , cchSystemId : number) : void;
   endDTD() : void;
   startEntity(pwchName : IntPtr<number> , cchName : number) : void;
   endEntity(pwchName : IntPtr<number> , cchName : number) : void;
   startCDATA() : void;
   endCDATA() : void;
   comment(pwchChars : IntPtr<number> , cchChars : number) : void;
}

// [Guid("9b7e472a-0de4-4640-bff3-84d38a051c31")]
interface ISAXLocator
{
   /* Methods */
   getColumnNumber() : number;
   getLineNumber() : number;
   getPublicId() : IntPtr;
   getSystemId() : IntPtr;
}

// [Guid("70409222-ca09-4475-acb8-40312fe8d145")]
interface ISAXXMLFilter
{
   /* Methods */
   getFeature(pwchName : IntPtr<number> ) : boolean;
   putFeature(pwchName : IntPtr<number> , vfValue : boolean) : void;
   getProperty(pwchName : IntPtr<number> );
   putProperty(pwchName : IntPtr<number> , varValue) : void;
   getEntityResolver() : ISAXEntityResolver;
   putEntityResolver(pResolver : ISAXEntityResolver) : void;
   getContentHandler() : ISAXContentHandler;
   putContentHandler(pHandler : ISAXContentHandler) : void;
   getDTDHandler() : ISAXDTDHandler;
   putDTDHandler(pHandler : ISAXDTDHandler) : void;
   getErrorHandler() : ISAXErrorHandler;
   putErrorHandler(pHandler : ISAXErrorHandler) : void;
   getBaseURL() : IntPtr;
   putBaseURL(pwchBaseUrl : IntPtr<number> ) : void;
   getSecureBaseURL() : IntPtr;
   putSecureBaseURL(pwchSecureBaseUrl : IntPtr<number> ) : void;
   parse(varInput?) : void;
   parseURL(pwchUrl : IntPtr<number> ) : void;
   getParent() : ISAXXMLReader;
   putParent(pReader : ISAXXMLReader) : void;
}

// [Guid("a4f96ed0-f829-476e-81c0-cdc7bd2a0802")]
interface ISAXXMLReader
{
   /* Methods */
   getFeature(pwchName : IntPtr<number> ) : boolean;
   putFeature(pwchName : IntPtr<number> , vfValue : boolean) : void;
   getProperty(pwchName : IntPtr<number> );
   putProperty(pwchName : IntPtr<number> , varValue) : void;
   getEntityResolver() : ISAXEntityResolver;
   putEntityResolver(pResolver : ISAXEntityResolver) : void;
   getContentHandler() : ISAXContentHandler;
   putContentHandler(pHandler : ISAXContentHandler) : void;
   getDTDHandler() : ISAXDTDHandler;
   putDTDHandler(pHandler : ISAXDTDHandler) : void;
   getErrorHandler() : ISAXErrorHandler;
   putErrorHandler(pHandler : ISAXErrorHandler) : void;
   getBaseURL() : IntPtr;
   putBaseURL(pwchBaseUrl : IntPtr<number> ) : void;
   getSecureBaseURL() : IntPtr;
   putSecureBaseURL(pwchSecureBaseUrl : IntPtr<number> ) : void;
   parse(varInput?) : void;
   parseURL(pwchUrl : IntPtr<number> ) : void;
}

// [Guid("50ea08b4-dd1b-4664-9a50-c2f40f4bd79a")]
interface ISchema
{
   /* Methods */
   writeAnnotation(annotationSink) : boolean;
   /* Properties */
   readonly name : string;
   readonly namespaceURI : string;
   readonly schema : ISchema;
   readonly id : string;
   readonly itemType : SOMITEMTYPE;
   readonly unhandledAttributes : IVBSAXAttributes;
   readonly targetNamespace : string;
   readonly version : string;
   readonly types : ISchemaItemCollection;
   readonly elements : ISchemaItemCollection;
   readonly attributes : ISchemaItemCollection;
   readonly attributeGroups : ISchemaItemCollection;
   readonly modelGroups : ISchemaItemCollection;
   readonly notations : ISchemaItemCollection;
   readonly schemaLocations : ISchemaStringCollection;
}

// [Guid("50ea08bc-dd1b-4664-9a50-c2f40f4bd79a")]
interface ISchemaAny
{
   /* Methods */
   writeAnnotation(annotationSink) : boolean;
   /* Properties */
   readonly name : string;
   readonly namespaceURI : string;
   readonly schema : ISchema;
   readonly id : string;
   readonly itemType : SOMITEMTYPE;
   readonly unhandledAttributes : IVBSAXAttributes;
   readonly minOccurs;
   readonly maxOccurs;
   readonly namespaces : ISchemaStringCollection;
   readonly processContents : SCHEMAPROCESSCONTENTS;
}

// [Guid("50ea08b6-dd1b-4664-9a50-c2f40f4bd79a")]
interface ISchemaAttribute
{
   /* Methods */
   writeAnnotation(annotationSink) : boolean;
   /* Properties */
   readonly name : string;
   readonly namespaceURI : string;
   readonly schema : ISchema;
   readonly id : string;
   readonly itemType : SOMITEMTYPE;
   readonly unhandledAttributes : IVBSAXAttributes;
   readonly type : ISchemaType;
   readonly scope : ISchemaComplexType;
   readonly defaultValue : string;
   readonly fixedValue : string;
   readonly use : SCHEMAUSE;
   readonly isReference : boolean;
}

// [Guid("50ea08ba-dd1b-4664-9a50-c2f40f4bd79a")]
interface ISchemaAttributeGroup
{
   /* Methods */
   writeAnnotation(annotationSink) : boolean;
   /* Properties */
   readonly name : string;
   readonly namespaceURI : string;
   readonly schema : ISchema;
   readonly id : string;
   readonly itemType : SOMITEMTYPE;
   readonly unhandledAttributes : IVBSAXAttributes;
   readonly anyAttribute : ISchemaAny;
   readonly attributes : ISchemaItemCollection;
}

// [Guid("50ea08b9-dd1b-4664-9a50-c2f40f4bd79a")]
interface ISchemaComplexType
{
   /* Methods */
   writeAnnotation(annotationSink) : boolean;
   isValid(data : string) : boolean;
   /* Properties */
   readonly name : string;
   readonly namespaceURI : string;
   readonly schema : ISchema;
   readonly id : string;
   readonly itemType : SOMITEMTYPE;
   readonly unhandledAttributes : IVBSAXAttributes;
   readonly baseTypes : ISchemaItemCollection;
   readonly final : SCHEMADERIVATIONMETHOD;
   readonly variety : SCHEMATYPEVARIETY;
   readonly derivedBy : SCHEMADERIVATIONMETHOD;
   readonly minExclusive : string;
   readonly minInclusive : string;
   readonly maxExclusive : string;
   readonly maxInclusive : string;
   readonly totalDigits;
   readonly fractionDigits;
   readonly length;
   readonly minLength;
   readonly maxLength;
   readonly enumeration : ISchemaStringCollection;
   readonly whitespace : SCHEMAWHITESPACE;
   readonly patterns : ISchemaStringCollection;
   readonly isAbstract : boolean;
   readonly anyAttribute : ISchemaAny;
   readonly attributes : ISchemaItemCollection;
   readonly contentType : SCHEMACONTENTTYPE;
   readonly contentModel : ISchemaModelGroup;
   readonly prohibitedSubstitutions : SCHEMADERIVATIONMETHOD;
}

// [Guid("50ea08b7-dd1b-4664-9a50-c2f40f4bd79a")]
interface ISchemaElement
{
   /* Methods */
   writeAnnotation(annotationSink) : boolean;
   /* Properties */
   readonly name : string;
   readonly namespaceURI : string;
   readonly schema : ISchema;
   readonly id : string;
   readonly itemType : SOMITEMTYPE;
   readonly unhandledAttributes : IVBSAXAttributes;
   readonly minOccurs;
   readonly maxOccurs;
   readonly type : ISchemaType;
   readonly scope : ISchemaComplexType;
   readonly defaultValue : string;
   readonly fixedValue : string;
   readonly isNillable : boolean;
   readonly identityConstraints : ISchemaItemCollection;
   readonly substitutionGroup : ISchemaElement;
   readonly substitutionGroupExclusions : SCHEMADERIVATIONMETHOD;
   readonly disallowedSubstitutions : SCHEMADERIVATIONMETHOD;
   readonly isAbstract : boolean;
   readonly isReference : boolean;
}

// [Guid("50ea08bd-dd1b-4664-9a50-c2f40f4bd79a")]
interface ISchemaIdentityConstraint
{
   /* Methods */
   writeAnnotation(annotationSink) : boolean;
   /* Properties */
   readonly name : string;
   readonly namespaceURI : string;
   readonly schema : ISchema;
   readonly id : string;
   readonly itemType : SOMITEMTYPE;
   readonly unhandledAttributes : IVBSAXAttributes;
   readonly selector : string;
   readonly fields : ISchemaStringCollection;
   readonly referencedKey : ISchemaIdentityConstraint;
}

// [Guid("50ea08b3-dd1b-4664-9a50-c2f40f4bd79a")]
interface ISchemaItem
{
   /* Methods */
   writeAnnotation(annotationSink) : boolean;
   /* Properties */
   readonly name : string;
   readonly namespaceURI : string;
   readonly schema : ISchema;
   readonly id : string;
   readonly itemType : SOMITEMTYPE;
   readonly unhandledAttributes : IVBSAXAttributes;
}

// [Guid("50ea08b2-dd1b-4664-9a50-c2f40f4bd79a")]
interface ISchemaItemCollection
{
   /* Methods */
   itemByName(name : string) : ISchemaItem;
   itemByQName(name : string, namespaceURI : string) : ISchemaItem;
   GetEnumerator() : IEnumerator;
   /* Properties */
   item(index : number) : ISchemaItem;
   readonly length : number;
}

// [Guid("50ea08bb-dd1b-4664-9a50-c2f40f4bd79a")]
interface ISchemaModelGroup
{
   /* Methods */
   writeAnnotation(annotationSink) : boolean;
   /* Properties */
   readonly name : string;
   readonly namespaceURI : string;
   readonly schema : ISchema;
   readonly id : string;
   readonly itemType : SOMITEMTYPE;
   readonly unhandledAttributes : IVBSAXAttributes;
   readonly minOccurs;
   readonly maxOccurs;
   readonly particles : ISchemaItemCollection;
}

// [Guid("50ea08be-dd1b-4664-9a50-c2f40f4bd79a")]
interface ISchemaNotation
{
   /* Methods */
   writeAnnotation(annotationSink) : boolean;
   /* Properties */
   readonly name : string;
   readonly namespaceURI : string;
   readonly schema : ISchema;
   readonly id : string;
   readonly itemType : SOMITEMTYPE;
   readonly unhandledAttributes : IVBSAXAttributes;
   readonly systemIdentifier : string;
   readonly publicIdentifier : string;
}

// [Guid("50ea08b5-dd1b-4664-9a50-c2f40f4bd79a")]
interface ISchemaParticle
{
   /* Methods */
   writeAnnotation(annotationSink) : boolean;
   /* Properties */
   readonly name : string;
   readonly namespaceURI : string;
   readonly schema : ISchema;
   readonly id : string;
   readonly itemType : SOMITEMTYPE;
   readonly unhandledAttributes : IVBSAXAttributes;
   readonly minOccurs;
   readonly maxOccurs;
}

// [Guid("50ea08b1-dd1b-4664-9a50-c2f40f4bd79a")]
interface ISchemaStringCollection
{
   /* Methods */
   GetEnumerator() : IEnumerator;
   /* Properties */
   item(index : number) : string;
   readonly length : number;
}

// [Guid("50ea08b8-dd1b-4664-9a50-c2f40f4bd79a")]
interface ISchemaType
{
   /* Methods */
   writeAnnotation(annotationSink) : boolean;
   isValid(data : string) : boolean;
   /* Properties */
   readonly name : string;
   readonly namespaceURI : string;
   readonly schema : ISchema;
   readonly id : string;
   readonly itemType : SOMITEMTYPE;
   readonly unhandledAttributes : IVBSAXAttributes;
   readonly baseTypes : ISchemaItemCollection;
   readonly final : SCHEMADERIVATIONMETHOD;
   readonly variety : SCHEMATYPEVARIETY;
   readonly derivedBy : SCHEMADERIVATIONMETHOD;
   readonly minExclusive : string;
   readonly minInclusive : string;
   readonly maxExclusive : string;
   readonly maxInclusive : string;
   readonly totalDigits;
   readonly fractionDigits;
   readonly length;
   readonly minLength;
   readonly maxLength;
   readonly enumeration : ISchemaStringCollection;
   readonly whitespace : SCHEMAWHITESPACE;
   readonly patterns : ISchemaStringCollection;
}

// [Guid("2e9196bf-13ba-4dd4-91ca-6c571f281495")]
interface IServerXMLHTTPRequest
{
   /* Methods */
   open(bstrMethod : string, bstrUrl : string, varAsync?, bstrUser?, bstrPassword?) : void;
   setRequestHeader(bstrHeader : string, bstrValue : string) : void;
   getResponseHeader(bstrHeader : string) : string;
   getAllResponseHeaders() : string;
   send(varBody?) : void;
   abort() : void;
   setTimeouts(resolveTimeout : number, connectTimeout : number, sendTimeout : number, receiveTimeout : number) : void;
   waitForResponse(timeoutInSeconds?) : boolean;
   getOption(option : SERVERXMLHTTP_OPTION);
   setOption(option : SERVERXMLHTTP_OPTION, value) : void;
   /* Properties */
   readonly status : number;
   readonly statusText : string;
   readonly responseXML;
   readonly responseText : string;
   readonly responseBody;
   readonly responseStream;
   readonly readyState : number;
   /*writeonly*/ onreadystatechange;
}

// [Guid("2e01311b-c322-4b0a-bd77-b90cfdc8dce7")]
interface IServerXMLHTTPRequest2
{
   /* Methods */
   open(bstrMethod : string, bstrUrl : string, varAsync?, bstrUser?, bstrPassword?) : void;
   setRequestHeader(bstrHeader : string, bstrValue : string) : void;
   getResponseHeader(bstrHeader : string) : string;
   getAllResponseHeaders() : string;
   send(varBody?) : void;
   abort() : void;
   setTimeouts(resolveTimeout : number, connectTimeout : number, sendTimeout : number, receiveTimeout : number) : void;
   waitForResponse(timeoutInSeconds?) : boolean;
   getOption(option : SERVERXMLHTTP_OPTION);
   setOption(option : SERVERXMLHTTP_OPTION, value) : void;
   setProxy(proxySetting : SXH_PROXY_SETTING, varProxyServer?, varBypassList?) : void;
   setProxyCredentials(bstrUserName : string, bstrPassword : string) : void;
   /* Properties */
   readonly status : number;
   readonly statusText : string;
   readonly responseXML;
   readonly responseText : string;
   readonly responseBody;
   readonly responseStream;
   readonly readyState : number;
   /*writeonly*/ onreadystatechange;
}

// [Guid("c90352f5-643c-4fbc-bb23-e996eb2d51fd")]
interface IVBMXNamespaceManager
{
   /* Methods */
   reset() : void;
   pushContext() : void;
   pushNodeContext(contextNode : IXMLDOMNode, fDeep? : boolean) : void;
   popContext() : void;
   declarePrefix(prefix : string, namespaceURI : string) : void;
   getDeclaredPrefixes() : IMXNamespacePrefixes;
   getPrefixes(namespaceURI : string) : IMXNamespacePrefixes;
   getURI(prefix : string);
   getURIFromNode(strPrefix : string, contextNode : IXMLDOMNode);
   /* Properties */
   allowOverride : boolean;
}

// [Guid("10dc0586-132b-4cac-8bb3-db00ac8b7ee0")]
interface IVBSAXAttributes
{
   /* Methods */
   getURI(nIndex : number) : string;
   getLocalName(nIndex : number) : string;
   getQName(nIndex : number) : string;
   getIndexFromName(strURI : string, strLocalName : string) : number;
   getIndexFromQName(strQName : string) : number;
   getType(nIndex : number) : string;
   getTypeFromName(strURI : string, strLocalName : string) : string;
   getTypeFromQName(strQName : string) : string;
   getValue(nIndex : number) : string;
   getValueFromName(strURI : string, strLocalName : string) : string;
   getValueFromQName(strQName : string) : string;
   /* Properties */
   readonly length : number;
}

// [Guid("2ed7290a-4dd5-4b46-bb26-4e4155e77faa")]
interface IVBSAXContentHandler
{
   /* Methods */
   startDocument() : void;
   endDocument() : void;
   startPrefixMapping(/*[Out,In]*/ strPrefix : IntPtr<string> , /*[Out,In]*/ strURI : IntPtr<string> ) : void;
   endPrefixMapping(/*[Out,In]*/ strPrefix : IntPtr<string> ) : void;
   startElement(/*[Out,In]*/ strNamespaceURI : IntPtr<string> , /*[Out,In]*/ strLocalName : IntPtr<string> , /*[Out,In]*/ strQName : IntPtr<string> , oAttributes : IVBSAXAttributes) : void;
   endElement(/*[Out,In]*/ strNamespaceURI : IntPtr<string> , /*[Out,In]*/ strLocalName : IntPtr<string> , /*[Out,In]*/ strQName : IntPtr<string> ) : void;
   characters(/*[Out,In]*/ strChars : IntPtr<string> ) : void;
   ignorableWhitespace(/*[Out,In]*/ strChars : IntPtr<string> ) : void;
   processingInstruction(/*[Out,In]*/ strTarget : IntPtr<string> , /*[Out,In]*/ strData : IntPtr<string> ) : void;
   skippedEntity(/*[Out,In]*/ strName : IntPtr<string> ) : void;
   /* Properties */
   /*writeonly*/ documentLocator : IVBSAXLocator;
}

// [Guid("e8917260-7579-4be1-b5dd-7afbfa6f077b")]
interface IVBSAXDeclHandler
{
   /* Methods */
   elementDecl(/*[Out,In]*/ strName : IntPtr<string> , /*[Out,In]*/ strModel : IntPtr<string> ) : void;
   attributeDecl(/*[Out,In]*/ strElementName : IntPtr<string> , /*[Out,In]*/ strAttributeName : IntPtr<string> , /*[Out,In]*/ strType : IntPtr<string> , /*[Out,In]*/ strValueDefault : IntPtr<string> , /*[Out,In]*/ strValue : IntPtr<string> ) : void;
   internalEntityDecl(/*[Out,In]*/ strName : IntPtr<string> , /*[Out,In]*/ strValue : IntPtr<string> ) : void;
   externalEntityDecl(/*[Out,In]*/ strName : IntPtr<string> , /*[Out,In]*/ strPublicId : IntPtr<string> , /*[Out,In]*/ strSystemId : IntPtr<string> ) : void;
}

// [Guid("24fb3297-302d-4620-ba39-3a732d850558")]
interface IVBSAXDTDHandler
{
   /* Methods */
   notationDecl(/*[Out,In]*/ strName : IntPtr<string> , /*[Out,In]*/ strPublicId : IntPtr<string> , /*[Out,In]*/ strSystemId : IntPtr<string> ) : void;
   unparsedEntityDecl(/*[Out,In]*/ strName : IntPtr<string> , /*[Out,In]*/ strPublicId : IntPtr<string> , /*[Out,In]*/ strSystemId : IntPtr<string> , /*[Out,In]*/ strNotationName : IntPtr<string> ) : void;
}

// [Guid("0c05d096-f45b-4aca-ad1a-aa0bc25518dc")]
interface IVBSAXEntityResolver
{
   /* Methods */
   resolveEntity(/*[Out,In]*/ strPublicId : IntPtr<string> , /*[Out,In]*/ strSystemId : IntPtr<string> );
}

// [Guid("d963d3fe-173c-4862-9095-b92f66995f52")]
interface IVBSAXErrorHandler
{
   /* Methods */
   error(oLocator : IVBSAXLocator, /*[Out,In]*/ strErrorMessage : IntPtr<string> , nErrorCode : number) : void;
   fatalError(oLocator : IVBSAXLocator, /*[Out,In]*/ strErrorMessage : IntPtr<string> , nErrorCode : number) : void;
   ignorableWarning(oLocator : IVBSAXLocator, /*[Out,In]*/ strErrorMessage : IntPtr<string> , nErrorCode : number) : void;
}

// [Guid("032aac35-8c0e-4d9d-979f-e3b702935576")]
interface IVBSAXLexicalHandler
{
   /* Methods */
   startDTD(/*[Out,In]*/ strName : IntPtr<string> , /*[Out,In]*/ strPublicId : IntPtr<string> , /*[Out,In]*/ strSystemId : IntPtr<string> ) : void;
   endDTD() : void;
   startEntity(/*[Out,In]*/ strName : IntPtr<string> ) : void;
   endEntity(/*[Out,In]*/ strName : IntPtr<string> ) : void;
   startCDATA() : void;
   endCDATA() : void;
   comment(/*[Out,In]*/ strChars : IntPtr<string> ) : void;
}

// [Guid("796e7ac5-5aa2-4eff-acad-3faaf01a3288")]
interface IVBSAXLocator
{
   /* Properties */
   readonly columnNumber : number;
   readonly lineNumber : number;
   readonly publicId : string;
   readonly systemId : string;
}

// [Guid("1299eb1b-5b88-433e-82de-82ca75ad4e04")]
interface IVBSAXXMLFilter
{
   /* Properties */
   parent : IVBSAXXMLReader;
}

// [Guid("8c033caa-6cd6-4f73-b728-4531af74945f")]
interface IVBSAXXMLReader
{
   /* Methods */
   getFeature(strName : string) : boolean;
   putFeature(strName : string, fValue : boolean) : void;
   getProperty(strName : string);
   putProperty(strName : string, varValue) : void;
   parse(varInput?) : void;
   parseURL(strURL : string) : void;
   /* Properties */
   entityResolver : IVBSAXEntityResolver;
   contentHandler : IVBSAXContentHandler;
   dtdHandler : IVBSAXDTDHandler;
   errorHandler : IVBSAXErrorHandler;
   baseURL : string;
   secureBaseURL : string;
}

// [Guid("d4d4a0fc-3b73-11d1-b2b4-00c04fb92596")]
interface IXMLAttribute
{
   /* Properties */
   readonly name : string;
   readonly value : string;
}

// [Guid("f52e2b61-18a1-11d1-b105-00805f49916b")]
interface IXMLDocument
{
   /* Methods */
   createElement(vType, var1?) : IXMLElement;
   /* Properties */
   readonly root : IXMLElement;
   readonly fileSize : string;
   readonly fileModifiedDate : string;
   readonly fileUpdatedDate : string;
   url : string;
   readonly mimeType : string;
   readonly readyState : number;
   charset : string;
   readonly version : string;
   readonly doctype : string;
   readonly dtdURL : string;
}

// [Guid("2b8de2fe-8d2d-11d1-b2fc-00c04fd915a9")]
interface IXMLDocument2
{
   /* Methods */
   createElement(vType, var1?) : IXMLElement2;
   /* Properties */
   readonly root : IXMLElement2;
   readonly fileSize : string;
   readonly fileModifiedDate : string;
   readonly fileUpdatedDate : string;
   url : string;
   readonly mimeType : string;
   readonly readyState : number;
   charset : string;
   readonly version : string;
   readonly doctype : string;
   readonly dtdURL : string;
   async : boolean;
}

// [Guid("2933bf85-7b36-11d2-b20e-00c04f983e60")]
interface IXMLDOMAttribute
{
   /* Methods */
   insertBefore(newChild : IXMLDOMNode, refChild) : IXMLDOMNode;
   replaceChild(newChild : IXMLDOMNode, oldChild : IXMLDOMNode) : IXMLDOMNode;
   removeChild(childNode : IXMLDOMNode) : IXMLDOMNode;
   appendChild(newChild : IXMLDOMNode) : IXMLDOMNode;
   hasChildNodes() : boolean;
   cloneNode(deep : boolean) : IXMLDOMNode;
   transformNode(stylesheet : IXMLDOMNode) : string;
   selectNodes(queryString : string) : IXMLDOMNodeList;
   selectSingleNode(queryString : string) : IXMLDOMNode;
   transformNodeToObject(stylesheet : IXMLDOMNode, outputObject) : void;
   /* Properties */
   readonly nodeName : string;
   nodeValue;
   readonly nodeType : DOMNodeType;
   readonly parentNode : IXMLDOMNode;
   readonly childNodes : IXMLDOMNodeList;
   readonly firstChild : IXMLDOMNode;
   readonly lastChild : IXMLDOMNode;
   readonly previousSibling : IXMLDOMNode;
   readonly nextSibling : IXMLDOMNode;
   readonly attributes : IXMLDOMNamedNodeMap;
   readonly ownerDocument : IXMLDOMDocument;
   readonly nodeTypeString : string;
   text : string;
   readonly specified : boolean;
   readonly definition : IXMLDOMNode;
   nodeTypedValue;
   dataType;
   readonly xml : string;
   readonly parsed : boolean;
   readonly namespaceURI : string;
   readonly prefix : string;
   readonly baseName : string;
   readonly name : string;
   value;
}

// [Guid("2933bf8a-7b36-11d2-b20e-00c04f983e60")]
interface IXMLDOMCDATASection
{
   /* Methods */
   insertBefore(newChild : IXMLDOMNode, refChild) : IXMLDOMNode;
   replaceChild(newChild : IXMLDOMNode, oldChild : IXMLDOMNode) : IXMLDOMNode;
   removeChild(childNode : IXMLDOMNode) : IXMLDOMNode;
   appendChild(newChild : IXMLDOMNode) : IXMLDOMNode;
   hasChildNodes() : boolean;
   cloneNode(deep : boolean) : IXMLDOMNode;
   transformNode(stylesheet : IXMLDOMNode) : string;
   selectNodes(queryString : string) : IXMLDOMNodeList;
   selectSingleNode(queryString : string) : IXMLDOMNode;
   transformNodeToObject(stylesheet : IXMLDOMNode, outputObject) : void;
   substringData(offset : number, count : number) : string;
   appendData(data : string) : void;
   insertData(offset : number, data : string) : void;
   deleteData(offset : number, count : number) : void;
   replaceData(offset : number, count : number, data : string) : void;
   splitText(offset : number) : IXMLDOMText;
   /* Properties */
   readonly nodeName : string;
   nodeValue;
   readonly nodeType : DOMNodeType;
   readonly parentNode : IXMLDOMNode;
   readonly childNodes : IXMLDOMNodeList;
   readonly firstChild : IXMLDOMNode;
   readonly lastChild : IXMLDOMNode;
   readonly previousSibling : IXMLDOMNode;
   readonly nextSibling : IXMLDOMNode;
   readonly attributes : IXMLDOMNamedNodeMap;
   readonly ownerDocument : IXMLDOMDocument;
   readonly nodeTypeString : string;
   text : string;
   readonly specified : boolean;
   readonly definition : IXMLDOMNode;
   nodeTypedValue;
   dataType;
   readonly xml : string;
   readonly parsed : boolean;
   readonly namespaceURI : string;
   readonly prefix : string;
   readonly baseName : string;
   data : string;
   readonly length : number;
}

// [Guid("2933bf84-7b36-11d2-b20e-00c04f983e60")]
interface IXMLDOMCharacterData
{
   /* Methods */
   insertBefore(newChild : IXMLDOMNode, refChild) : IXMLDOMNode;
   replaceChild(newChild : IXMLDOMNode, oldChild : IXMLDOMNode) : IXMLDOMNode;
   removeChild(childNode : IXMLDOMNode) : IXMLDOMNode;
   appendChild(newChild : IXMLDOMNode) : IXMLDOMNode;
   hasChildNodes() : boolean;
   cloneNode(deep : boolean) : IXMLDOMNode;
   transformNode(stylesheet : IXMLDOMNode) : string;
   selectNodes(queryString : string) : IXMLDOMNodeList;
   selectSingleNode(queryString : string) : IXMLDOMNode;
   transformNodeToObject(stylesheet : IXMLDOMNode, outputObject) : void;
   substringData(offset : number, count : number) : string;
   appendData(data : string) : void;
   insertData(offset : number, data : string) : void;
   deleteData(offset : number, count : number) : void;
   replaceData(offset : number, count : number, data : string) : void;
   /* Properties */
   readonly nodeName : string;
   nodeValue;
   readonly nodeType : DOMNodeType;
   readonly parentNode : IXMLDOMNode;
   readonly childNodes : IXMLDOMNodeList;
   readonly firstChild : IXMLDOMNode;
   readonly lastChild : IXMLDOMNode;
   readonly previousSibling : IXMLDOMNode;
   readonly nextSibling : IXMLDOMNode;
   readonly attributes : IXMLDOMNamedNodeMap;
   readonly ownerDocument : IXMLDOMDocument;
   readonly nodeTypeString : string;
   text : string;
   readonly specified : boolean;
   readonly definition : IXMLDOMNode;
   nodeTypedValue;
   dataType;
   readonly xml : string;
   readonly parsed : boolean;
   readonly namespaceURI : string;
   readonly prefix : string;
   readonly baseName : string;
   data : string;
   readonly length : number;
}

// [Guid("2933bf88-7b36-11d2-b20e-00c04f983e60")]
interface IXMLDOMComment
{
   /* Methods */
   insertBefore(newChild : IXMLDOMNode, refChild) : IXMLDOMNode;
   replaceChild(newChild : IXMLDOMNode, oldChild : IXMLDOMNode) : IXMLDOMNode;
   removeChild(childNode : IXMLDOMNode) : IXMLDOMNode;
   appendChild(newChild : IXMLDOMNode) : IXMLDOMNode;
   hasChildNodes() : boolean;
   cloneNode(deep : boolean) : IXMLDOMNode;
   transformNode(stylesheet : IXMLDOMNode) : string;
   selectNodes(queryString : string) : IXMLDOMNodeList;
   selectSingleNode(queryString : string) : IXMLDOMNode;
   transformNodeToObject(stylesheet : IXMLDOMNode, outputObject) : void;
   substringData(offset : number, count : number) : string;
   appendData(data : string) : void;
   insertData(offset : number, data : string) : void;
   deleteData(offset : number, count : number) : void;
   replaceData(offset : number, count : number, data : string) : void;
   /* Properties */
   readonly nodeName : string;
   nodeValue;
   readonly nodeType : DOMNodeType;
   readonly parentNode : IXMLDOMNode;
   readonly childNodes : IXMLDOMNodeList;
   readonly firstChild : IXMLDOMNode;
   readonly lastChild : IXMLDOMNode;
   readonly previousSibling : IXMLDOMNode;
   readonly nextSibling : IXMLDOMNode;
   readonly attributes : IXMLDOMNamedNodeMap;
   readonly ownerDocument : IXMLDOMDocument;
   readonly nodeTypeString : string;
   text : string;
   readonly specified : boolean;
   readonly definition : IXMLDOMNode;
   nodeTypedValue;
   dataType;
   readonly xml : string;
   readonly parsed : boolean;
   readonly namespaceURI : string;
   readonly prefix : string;
   readonly baseName : string;
   data : string;
   readonly length : number;
}

// [Guid("2933bf81-7b36-11d2-b20e-00c04f983e60")]
interface IXMLDOMDocument
{
   /* Methods */
   insertBefore(newChild : IXMLDOMNode, refChild) : IXMLDOMNode;
   replaceChild(newChild : IXMLDOMNode, oldChild : IXMLDOMNode) : IXMLDOMNode;
   removeChild(childNode : IXMLDOMNode) : IXMLDOMNode;
   appendChild(newChild : IXMLDOMNode) : IXMLDOMNode;
   hasChildNodes() : boolean;
   cloneNode(deep : boolean) : IXMLDOMNode;
   transformNode(stylesheet : IXMLDOMNode) : string;
   selectNodes(queryString : string) : IXMLDOMNodeList;
   selectSingleNode(queryString : string) : IXMLDOMNode;
   transformNodeToObject(stylesheet : IXMLDOMNode, outputObject) : void;
   createElement(tagName : string) : IXMLDOMElement;
   createDocumentFragment() : IXMLDOMDocumentFragment;
   createTextNode(data : string) : IXMLDOMText;
   createComment(data : string) : IXMLDOMComment;
   createCDATASection(data : string) : IXMLDOMCDATASection;
   createProcessingInstruction(target : string, data : string) : IXMLDOMProcessingInstruction;
   createAttribute(name : string) : IXMLDOMAttribute;
   createEntityReference(name : string) : IXMLDOMEntityReference;
   getElementsByTagName(tagName : string) : IXMLDOMNodeList;
   createNode(type, name : string, namespaceURI : string) : IXMLDOMNode;
   nodeFromID(idString : string) : IXMLDOMNode;
   load(xmlSource) : boolean;
   abort() : void;
   loadXML(bstrXML : string) : boolean;
   save(destination) : void;
   /* Properties */
   readonly nodeName : string;
   nodeValue;
   readonly nodeType : DOMNodeType;
   readonly parentNode : IXMLDOMNode;
   readonly childNodes : IXMLDOMNodeList;
   readonly firstChild : IXMLDOMNode;
   readonly lastChild : IXMLDOMNode;
   readonly previousSibling : IXMLDOMNode;
   readonly nextSibling : IXMLDOMNode;
   readonly attributes : IXMLDOMNamedNodeMap;
   readonly ownerDocument : IXMLDOMDocument;
   readonly nodeTypeString : string;
   text : string;
   readonly specified : boolean;
   readonly definition : IXMLDOMNode;
   nodeTypedValue;
   dataType;
   readonly xml : string;
   readonly parsed : boolean;
   readonly namespaceURI : string;
   readonly prefix : string;
   readonly baseName : string;
   readonly doctype : IXMLDOMDocumentType;
   readonly implementation : IXMLDOMImplementation;
   documentElement : IXMLDOMElement;
   readonly readyState : number;
   readonly parseError : IXMLDOMParseError;
   readonly url : string;
   async : boolean;
   validateOnParse : boolean;
   resolveExternals : boolean;
   preserveWhiteSpace : boolean;
   /*writeonly*/ onreadystatechange;
   /*writeonly*/ ondataavailable;
   /*writeonly*/ ontransformnode;
}

// [Guid("2933bf95-7b36-11d2-b20e-00c04f983e60")]
interface IXMLDOMDocument2
{
   /* Methods */
   insertBefore(newChild : IXMLDOMNode, refChild) : IXMLDOMNode;
   replaceChild(newChild : IXMLDOMNode, oldChild : IXMLDOMNode) : IXMLDOMNode;
   removeChild(childNode : IXMLDOMNode) : IXMLDOMNode;
   appendChild(newChild : IXMLDOMNode) : IXMLDOMNode;
   hasChildNodes() : boolean;
   cloneNode(deep : boolean) : IXMLDOMNode;
   transformNode(stylesheet : IXMLDOMNode) : string;
   selectNodes(queryString : string) : IXMLDOMNodeList;
   selectSingleNode(queryString : string) : IXMLDOMNode;
   transformNodeToObject(stylesheet : IXMLDOMNode, outputObject) : void;
   createElement(tagName : string) : IXMLDOMElement;
   createDocumentFragment() : IXMLDOMDocumentFragment;
   createTextNode(data : string) : IXMLDOMText;
   createComment(data : string) : IXMLDOMComment;
   createCDATASection(data : string) : IXMLDOMCDATASection;
   createProcessingInstruction(target : string, data : string) : IXMLDOMProcessingInstruction;
   createAttribute(name : string) : IXMLDOMAttribute;
   createEntityReference(name : string) : IXMLDOMEntityReference;
   getElementsByTagName(tagName : string) : IXMLDOMNodeList;
   createNode(type, name : string, namespaceURI : string) : IXMLDOMNode;
   nodeFromID(idString : string) : IXMLDOMNode;
   load(xmlSource) : boolean;
   abort() : void;
   loadXML(bstrXML : string) : boolean;
   save(destination) : void;
   validate() : IXMLDOMParseError;
   setProperty(name : string, value) : void;
   getProperty(name : string);
   /* Properties */
   readonly nodeName : string;
   nodeValue;
   readonly nodeType : DOMNodeType;
   readonly parentNode : IXMLDOMNode;
   readonly childNodes : IXMLDOMNodeList;
   readonly firstChild : IXMLDOMNode;
   readonly lastChild : IXMLDOMNode;
   readonly previousSibling : IXMLDOMNode;
   readonly nextSibling : IXMLDOMNode;
   readonly attributes : IXMLDOMNamedNodeMap;
   readonly ownerDocument : IXMLDOMDocument;
   readonly nodeTypeString : string;
   text : string;
   readonly specified : boolean;
   readonly definition : IXMLDOMNode;
   nodeTypedValue;
   dataType;
   readonly xml : string;
   readonly parsed : boolean;
   readonly namespaceURI : string;
   readonly prefix : string;
   readonly baseName : string;
   readonly doctype : IXMLDOMDocumentType;
   readonly implementation : IXMLDOMImplementation;
   documentElement : IXMLDOMElement;
   readonly readyState : number;
   readonly parseError : IXMLDOMParseError;
   readonly url : string;
   async : boolean;
   validateOnParse : boolean;
   resolveExternals : boolean;
   preserveWhiteSpace : boolean;
   /*writeonly*/ onreadystatechange;
   /*writeonly*/ ondataavailable;
   /*writeonly*/ ontransformnode;
   readonly namespaces : IXMLDOMSchemaCollection;
   schemas;
}

// [Guid("2933bf96-7b36-11d2-b20e-00c04f983e60")]
interface IXMLDOMDocument3
{
   /* Methods */
   insertBefore(newChild : IXMLDOMNode, refChild) : IXMLDOMNode;
   replaceChild(newChild : IXMLDOMNode, oldChild : IXMLDOMNode) : IXMLDOMNode;
   removeChild(childNode : IXMLDOMNode) : IXMLDOMNode;
   appendChild(newChild : IXMLDOMNode) : IXMLDOMNode;
   hasChildNodes() : boolean;
   cloneNode(deep : boolean) : IXMLDOMNode;
   transformNode(stylesheet : IXMLDOMNode) : string;
   selectNodes(queryString : string) : IXMLDOMNodeList;
   selectSingleNode(queryString : string) : IXMLDOMNode;
   transformNodeToObject(stylesheet : IXMLDOMNode, outputObject) : void;
   createElement(tagName : string) : IXMLDOMElement;
   createDocumentFragment() : IXMLDOMDocumentFragment;
   createTextNode(data : string) : IXMLDOMText;
   createComment(data : string) : IXMLDOMComment;
   createCDATASection(data : string) : IXMLDOMCDATASection;
   createProcessingInstruction(target : string, data : string) : IXMLDOMProcessingInstruction;
   createAttribute(name : string) : IXMLDOMAttribute;
   createEntityReference(name : string) : IXMLDOMEntityReference;
   getElementsByTagName(tagName : string) : IXMLDOMNodeList;
   createNode(type, name : string, namespaceURI : string) : IXMLDOMNode;
   nodeFromID(idString : string) : IXMLDOMNode;
   load(xmlSource) : boolean;
   abort() : void;
   loadXML(bstrXML : string) : boolean;
   save(destination) : void;
   validate() : IXMLDOMParseError;
   setProperty(name : string, value) : void;
   getProperty(name : string);
   validateNode(node : IXMLDOMNode) : IXMLDOMParseError;
   importNode(node : IXMLDOMNode, deep : boolean) : IXMLDOMNode;
   /* Properties */
   readonly nodeName : string;
   nodeValue;
   readonly nodeType : DOMNodeType;
   readonly parentNode : IXMLDOMNode;
   readonly childNodes : IXMLDOMNodeList;
   readonly firstChild : IXMLDOMNode;
   readonly lastChild : IXMLDOMNode;
   readonly previousSibling : IXMLDOMNode;
   readonly nextSibling : IXMLDOMNode;
   readonly attributes : IXMLDOMNamedNodeMap;
   readonly ownerDocument : IXMLDOMDocument;
   readonly nodeTypeString : string;
   text : string;
   readonly specified : boolean;
   readonly definition : IXMLDOMNode;
   nodeTypedValue;
   dataType;
   readonly xml : string;
   readonly parsed : boolean;
   readonly namespaceURI : string;
   readonly prefix : string;
   readonly baseName : string;
   readonly doctype : IXMLDOMDocumentType;
   readonly implementation : IXMLDOMImplementation;
   documentElement : IXMLDOMElement;
   readonly readyState : number;
   readonly parseError : IXMLDOMParseError;
   readonly url : string;
   async : boolean;
   validateOnParse : boolean;
   resolveExternals : boolean;
   preserveWhiteSpace : boolean;
   /*writeonly*/ onreadystatechange;
   /*writeonly*/ ondataavailable;
   /*writeonly*/ ontransformnode;
   readonly namespaces : IXMLDOMSchemaCollection;
   schemas;
}

// [Guid("3efaa413-272f-11d2-836f-0000f87a7782")]
interface IXMLDOMDocumentFragment
{
   /* Methods */
   insertBefore(newChild : IXMLDOMNode, refChild) : IXMLDOMNode;
   replaceChild(newChild : IXMLDOMNode, oldChild : IXMLDOMNode) : IXMLDOMNode;
   removeChild(childNode : IXMLDOMNode) : IXMLDOMNode;
   appendChild(newChild : IXMLDOMNode) : IXMLDOMNode;
   hasChildNodes() : boolean;
   cloneNode(deep : boolean) : IXMLDOMNode;
   transformNode(stylesheet : IXMLDOMNode) : string;
   selectNodes(queryString : string) : IXMLDOMNodeList;
   selectSingleNode(queryString : string) : IXMLDOMNode;
   transformNodeToObject(stylesheet : IXMLDOMNode, outputObject) : void;
   /* Properties */
   readonly nodeName : string;
   nodeValue;
   readonly nodeType : DOMNodeType;
   readonly parentNode : IXMLDOMNode;
   readonly childNodes : IXMLDOMNodeList;
   readonly firstChild : IXMLDOMNode;
   readonly lastChild : IXMLDOMNode;
   readonly previousSibling : IXMLDOMNode;
   readonly nextSibling : IXMLDOMNode;
   readonly attributes : IXMLDOMNamedNodeMap;
   readonly ownerDocument : IXMLDOMDocument;
   readonly nodeTypeString : string;
   text : string;
   readonly specified : boolean;
   readonly definition : IXMLDOMNode;
   nodeTypedValue;
   dataType;
   readonly xml : string;
   readonly parsed : boolean;
   readonly namespaceURI : string;
   readonly prefix : string;
   readonly baseName : string;
}

// [Guid("2933bf8b-7b36-11d2-b20e-00c04f983e60")]
interface IXMLDOMDocumentType
{
   /* Methods */
   insertBefore(newChild : IXMLDOMNode, refChild) : IXMLDOMNode;
   replaceChild(newChild : IXMLDOMNode, oldChild : IXMLDOMNode) : IXMLDOMNode;
   removeChild(childNode : IXMLDOMNode) : IXMLDOMNode;
   appendChild(newChild : IXMLDOMNode) : IXMLDOMNode;
   hasChildNodes() : boolean;
   cloneNode(deep : boolean) : IXMLDOMNode;
   transformNode(stylesheet : IXMLDOMNode) : string;
   selectNodes(queryString : string) : IXMLDOMNodeList;
   selectSingleNode(queryString : string) : IXMLDOMNode;
   transformNodeToObject(stylesheet : IXMLDOMNode, outputObject) : void;
   /* Properties */
   readonly nodeName : string;
   nodeValue;
   readonly nodeType : DOMNodeType;
   readonly parentNode : IXMLDOMNode;
   readonly childNodes : IXMLDOMNodeList;
   readonly firstChild : IXMLDOMNode;
   readonly lastChild : IXMLDOMNode;
   readonly previousSibling : IXMLDOMNode;
   readonly nextSibling : IXMLDOMNode;
   readonly attributes : IXMLDOMNamedNodeMap;
   readonly ownerDocument : IXMLDOMDocument;
   readonly nodeTypeString : string;
   text : string;
   readonly specified : boolean;
   readonly definition : IXMLDOMNode;
   nodeTypedValue;
   dataType;
   readonly xml : string;
   readonly parsed : boolean;
   readonly namespaceURI : string;
   readonly prefix : string;
   readonly baseName : string;
   readonly name : string;
   readonly entities : IXMLDOMNamedNodeMap;
   readonly notations : IXMLDOMNamedNodeMap;
}

// [Guid("2933bf86-7b36-11d2-b20e-00c04f983e60")]
interface IXMLDOMElement
{
   /* Methods */
   insertBefore(newChild : IXMLDOMNode, refChild) : IXMLDOMNode;
   replaceChild(newChild : IXMLDOMNode, oldChild : IXMLDOMNode) : IXMLDOMNode;
   removeChild(childNode : IXMLDOMNode) : IXMLDOMNode;
   appendChild(newChild : IXMLDOMNode) : IXMLDOMNode;
   hasChildNodes() : boolean;
   cloneNode(deep : boolean) : IXMLDOMNode;
   transformNode(stylesheet : IXMLDOMNode) : string;
   selectNodes(queryString : string) : IXMLDOMNodeList;
   selectSingleNode(queryString : string) : IXMLDOMNode;
   transformNodeToObject(stylesheet : IXMLDOMNode, outputObject) : void;
   getAttribute(name : string);
   setAttribute(name : string, value) : void;
   removeAttribute(name : string) : void;
   getAttributeNode(name : string) : IXMLDOMAttribute;
   setAttributeNode(DOMAttribute : IXMLDOMAttribute) : IXMLDOMAttribute;
   removeAttributeNode(DOMAttribute : IXMLDOMAttribute) : IXMLDOMAttribute;
   getElementsByTagName(tagName : string) : IXMLDOMNodeList;
   normalize() : void;
   /* Properties */
   readonly nodeName : string;
   nodeValue;
   readonly nodeType : DOMNodeType;
   readonly parentNode : IXMLDOMNode;
   readonly childNodes : IXMLDOMNodeList;
   readonly firstChild : IXMLDOMNode;
   readonly lastChild : IXMLDOMNode;
   readonly previousSibling : IXMLDOMNode;
   readonly nextSibling : IXMLDOMNode;
   readonly attributes : IXMLDOMNamedNodeMap;
   readonly ownerDocument : IXMLDOMDocument;
   readonly nodeTypeString : string;
   text : string;
   readonly specified : boolean;
   readonly definition : IXMLDOMNode;
   nodeTypedValue;
   dataType;
   readonly xml : string;
   readonly parsed : boolean;
   readonly namespaceURI : string;
   readonly prefix : string;
   readonly baseName : string;
   readonly tagName : string;
}

// [Guid("2933bf8d-7b36-11d2-b20e-00c04f983e60")]
interface IXMLDOMEntity
{
   /* Methods */
   insertBefore(newChild : IXMLDOMNode, refChild) : IXMLDOMNode;
   replaceChild(newChild : IXMLDOMNode, oldChild : IXMLDOMNode) : IXMLDOMNode;
   removeChild(childNode : IXMLDOMNode) : IXMLDOMNode;
   appendChild(newChild : IXMLDOMNode) : IXMLDOMNode;
   hasChildNodes() : boolean;
   cloneNode(deep : boolean) : IXMLDOMNode;
   transformNode(stylesheet : IXMLDOMNode) : string;
   selectNodes(queryString : string) : IXMLDOMNodeList;
   selectSingleNode(queryString : string) : IXMLDOMNode;
   transformNodeToObject(stylesheet : IXMLDOMNode, outputObject) : void;
   /* Properties */
   readonly nodeName : string;
   nodeValue;
   readonly nodeType : DOMNodeType;
   readonly parentNode : IXMLDOMNode;
   readonly childNodes : IXMLDOMNodeList;
   readonly firstChild : IXMLDOMNode;
   readonly lastChild : IXMLDOMNode;
   readonly previousSibling : IXMLDOMNode;
   readonly nextSibling : IXMLDOMNode;
   readonly attributes : IXMLDOMNamedNodeMap;
   readonly ownerDocument : IXMLDOMDocument;
   readonly nodeTypeString : string;
   text : string;
   readonly specified : boolean;
   readonly definition : IXMLDOMNode;
   nodeTypedValue;
   dataType;
   readonly xml : string;
   readonly parsed : boolean;
   readonly namespaceURI : string;
   readonly prefix : string;
   readonly baseName : string;
   readonly publicId;
   readonly systemId;
   readonly notationName : string;
}

// [Guid("2933bf8e-7b36-11d2-b20e-00c04f983e60")]
interface IXMLDOMEntityReference
{
   /* Methods */
   insertBefore(newChild : IXMLDOMNode, refChild) : IXMLDOMNode;
   replaceChild(newChild : IXMLDOMNode, oldChild : IXMLDOMNode) : IXMLDOMNode;
   removeChild(childNode : IXMLDOMNode) : IXMLDOMNode;
   appendChild(newChild : IXMLDOMNode) : IXMLDOMNode;
   hasChildNodes() : boolean;
   cloneNode(deep : boolean) : IXMLDOMNode;
   transformNode(stylesheet : IXMLDOMNode) : string;
   selectNodes(queryString : string) : IXMLDOMNodeList;
   selectSingleNode(queryString : string) : IXMLDOMNode;
   transformNodeToObject(stylesheet : IXMLDOMNode, outputObject) : void;
   /* Properties */
   readonly nodeName : string;
   nodeValue;
   readonly nodeType : DOMNodeType;
   readonly parentNode : IXMLDOMNode;
   readonly childNodes : IXMLDOMNodeList;
   readonly firstChild : IXMLDOMNode;
   readonly lastChild : IXMLDOMNode;
   readonly previousSibling : IXMLDOMNode;
   readonly nextSibling : IXMLDOMNode;
   readonly attributes : IXMLDOMNamedNodeMap;
   readonly ownerDocument : IXMLDOMDocument;
   readonly nodeTypeString : string;
   text : string;
   readonly specified : boolean;
   readonly definition : IXMLDOMNode;
   nodeTypedValue;
   dataType;
   readonly xml : string;
   readonly parsed : boolean;
   readonly namespaceURI : string;
   readonly prefix : string;
   readonly baseName : string;
}

// [Guid("2933bf8f-7b36-11d2-b20e-00c04f983e60")]
interface IXMLDOMImplementation
{
   /* Methods */
   hasFeature(feature : string, version : string) : boolean;
}

// [Guid("2933bf83-7b36-11d2-b20e-00c04f983e60")]
interface IXMLDOMNamedNodeMap
{
   /* Methods */
   getNamedItem(name : string) : IXMLDOMNode;
   setNamedItem(newItem : IXMLDOMNode) : IXMLDOMNode;
   removeNamedItem(name : string) : IXMLDOMNode;
   getQualifiedItem(baseName : string, namespaceURI : string) : IXMLDOMNode;
   removeQualifiedItem(baseName : string, namespaceURI : string) : IXMLDOMNode;
   nextNode() : IXMLDOMNode;
   reset() : void;
   GetEnumerator() : IEnumerator;
   /* Properties */
   item(index : number) : IXMLDOMNode;
   readonly length : number;
}

// [Guid("2933bf80-7b36-11d2-b20e-00c04f983e60")]
interface IXMLDOMNode
{
   /* Methods */
   insertBefore(newChild : IXMLDOMNode, refChild) : IXMLDOMNode;
   replaceChild(newChild : IXMLDOMNode, oldChild : IXMLDOMNode) : IXMLDOMNode;
   removeChild(childNode : IXMLDOMNode) : IXMLDOMNode;
   appendChild(newChild : IXMLDOMNode) : IXMLDOMNode;
   hasChildNodes() : boolean;
   cloneNode(deep : boolean) : IXMLDOMNode;
   transformNode(stylesheet : IXMLDOMNode) : string;
   selectNodes(queryString : string) : IXMLDOMNodeList;
   selectSingleNode(queryString : string) : IXMLDOMNode;
   transformNodeToObject(stylesheet : IXMLDOMNode, outputObject) : void;
   /* Properties */
   readonly nodeName : string;
   nodeValue;
   readonly nodeType : DOMNodeType;
   readonly parentNode : IXMLDOMNode;
   readonly childNodes : IXMLDOMNodeList;
   readonly firstChild : IXMLDOMNode;
   readonly lastChild : IXMLDOMNode;
   readonly previousSibling : IXMLDOMNode;
   readonly nextSibling : IXMLDOMNode;
   readonly attributes : IXMLDOMNamedNodeMap;
   readonly ownerDocument : IXMLDOMDocument;
   readonly nodeTypeString : string;
   text : string;
   readonly specified : boolean;
   readonly definition : IXMLDOMNode;
   nodeTypedValue;
   dataType;
   readonly xml : string;
   readonly parsed : boolean;
   readonly namespaceURI : string;
   readonly prefix : string;
   readonly baseName : string;
}

// [Guid("2933bf82-7b36-11d2-b20e-00c04f983e60")]
interface IXMLDOMNodeList
{
   /* Methods */
   nextNode() : IXMLDOMNode;
   reset() : void;
   GetEnumerator() : IEnumerator;
   /* Properties */
   item(index : number) : IXMLDOMNode;
   readonly length : number;
}

// [Guid("2933bf8c-7b36-11d2-b20e-00c04f983e60")]
interface IXMLDOMNotation
{
   /* Methods */
   insertBefore(newChild : IXMLDOMNode, refChild) : IXMLDOMNode;
   replaceChild(newChild : IXMLDOMNode, oldChild : IXMLDOMNode) : IXMLDOMNode;
   removeChild(childNode : IXMLDOMNode) : IXMLDOMNode;
   appendChild(newChild : IXMLDOMNode) : IXMLDOMNode;
   hasChildNodes() : boolean;
   cloneNode(deep : boolean) : IXMLDOMNode;
   transformNode(stylesheet : IXMLDOMNode) : string;
   selectNodes(queryString : string) : IXMLDOMNodeList;
   selectSingleNode(queryString : string) : IXMLDOMNode;
   transformNodeToObject(stylesheet : IXMLDOMNode, outputObject) : void;
   /* Properties */
   readonly nodeName : string;
   nodeValue;
   readonly nodeType : DOMNodeType;
   readonly parentNode : IXMLDOMNode;
   readonly childNodes : IXMLDOMNodeList;
   readonly firstChild : IXMLDOMNode;
   readonly lastChild : IXMLDOMNode;
   readonly previousSibling : IXMLDOMNode;
   readonly nextSibling : IXMLDOMNode;
   readonly attributes : IXMLDOMNamedNodeMap;
   readonly ownerDocument : IXMLDOMDocument;
   readonly nodeTypeString : string;
   text : string;
   readonly specified : boolean;
   readonly definition : IXMLDOMNode;
   nodeTypedValue;
   dataType;
   readonly xml : string;
   readonly parsed : boolean;
   readonly namespaceURI : string;
   readonly prefix : string;
   readonly baseName : string;
   readonly publicId;
   readonly systemId;
}

// [Guid("3efaa426-272f-11d2-836f-0000f87a7782")]
interface IXMLDOMParseError
{
   /* Properties */
   readonly errorCode : number;
   readonly url : string;
   readonly reason : string;
   readonly srcText : string;
   readonly line : number;
   readonly linepos : number;
   readonly filepos : number;
}

// [Guid("3efaa428-272f-11d2-836f-0000f87a7782")]
interface IXMLDOMParseError2
{
   /* Methods */
   errorParameters(index : number) : string;
   /* Properties */
   readonly errorCode : number;
   readonly url : string;
   readonly reason : string;
   readonly srcText : string;
   readonly line : number;
   readonly linepos : number;
   readonly filepos : number;
   readonly errorXPath : string;
   readonly allErrors : IXMLDOMParseErrorCollection;
   readonly errorParametersCount : number;
}

// [Guid("3efaa429-272f-11d2-836f-0000f87a7782")]
interface IXMLDOMParseErrorCollection
{
   /* Methods */
   reset() : void;
   GetEnumerator() : IEnumerator;
   /* Properties */
   item(index : number) : IXMLDOMParseError2;
   readonly length : number;
   readonly next : IXMLDOMParseError2;
}

// [Guid("2933bf89-7b36-11d2-b20e-00c04f983e60")]
interface IXMLDOMProcessingInstruction
{
   /* Methods */
   insertBefore(newChild : IXMLDOMNode, refChild) : IXMLDOMNode;
   replaceChild(newChild : IXMLDOMNode, oldChild : IXMLDOMNode) : IXMLDOMNode;
   removeChild(childNode : IXMLDOMNode) : IXMLDOMNode;
   appendChild(newChild : IXMLDOMNode) : IXMLDOMNode;
   hasChildNodes() : boolean;
   cloneNode(deep : boolean) : IXMLDOMNode;
   transformNode(stylesheet : IXMLDOMNode) : string;
   selectNodes(queryString : string) : IXMLDOMNodeList;
   selectSingleNode(queryString : string) : IXMLDOMNode;
   transformNodeToObject(stylesheet : IXMLDOMNode, outputObject) : void;
   /* Properties */
   readonly nodeName : string;
   nodeValue;
   readonly nodeType : DOMNodeType;
   readonly parentNode : IXMLDOMNode;
   readonly childNodes : IXMLDOMNodeList;
   readonly firstChild : IXMLDOMNode;
   readonly lastChild : IXMLDOMNode;
   readonly previousSibling : IXMLDOMNode;
   readonly nextSibling : IXMLDOMNode;
   readonly attributes : IXMLDOMNamedNodeMap;
   readonly ownerDocument : IXMLDOMDocument;
   readonly nodeTypeString : string;
   text : string;
   readonly specified : boolean;
   readonly definition : IXMLDOMNode;
   nodeTypedValue;
   dataType;
   readonly xml : string;
   readonly parsed : boolean;
   readonly namespaceURI : string;
   readonly prefix : string;
   readonly baseName : string;
   readonly target : string;
   data : string;
}

// [Guid("373984c8-b845-449b-91e7-45ac83036ade")]
interface IXMLDOMSchemaCollection
{
   /* Methods */
   add(namespaceURI : string, var) : void;
   get(namespaceURI : string) : IXMLDOMNode;
   remove(namespaceURI : string) : void;
   addCollection(otherCollection : IXMLDOMSchemaCollection) : void;
   GetEnumerator() : IEnumerator;
   /* Properties */
   readonly length : number;
   namespaceURI(index : number) : string;
}

// [Guid("50ea08b0-dd1b-4664-9a50-c2f40f4bd79a")]
interface IXMLDOMSchemaCollection2
{
   /* Methods */
   add(namespaceURI : string, var) : void;
   get(namespaceURI : string) : IXMLDOMNode;
   remove(namespaceURI : string) : void;
   addCollection(otherCollection : IXMLDOMSchemaCollection) : void;
   GetEnumerator() : IEnumerator;
   validate() : void;
   getSchema(namespaceURI : string) : ISchema;
   getDeclaration(node : IXMLDOMNode) : ISchemaItem;
   /* Properties */
   readonly length : number;
   namespaceURI(index : number) : string;
   validateOnLoad : boolean;
}

// [Guid("aa634fc7-5888-44a7-a257-3a47150d3a0e")]
interface IXMLDOMSelection
{
   /* Methods */
   nextNode() : IXMLDOMNode;
   reset() : void;
   GetEnumerator() : IEnumerator;
   peekNode() : IXMLDOMNode;
   matches(pNode : IXMLDOMNode) : IXMLDOMNode;
   removeNext() : IXMLDOMNode;
   removeAll() : void;
   clone() : IXMLDOMSelection;
   getProperty(name : string);
   setProperty(name : string, value) : void;
   /* Properties */
   item(index : number) : IXMLDOMNode;
   readonly length : number;
   expr : string;
   context : IXMLDOMNode;
}

// [Guid("2933bf87-7b36-11d2-b20e-00c04f983e60")]
interface IXMLDOMText
{
   /* Methods */
   insertBefore(newChild : IXMLDOMNode, refChild) : IXMLDOMNode;
   replaceChild(newChild : IXMLDOMNode, oldChild : IXMLDOMNode) : IXMLDOMNode;
   removeChild(childNode : IXMLDOMNode) : IXMLDOMNode;
   appendChild(newChild : IXMLDOMNode) : IXMLDOMNode;
   hasChildNodes() : boolean;
   cloneNode(deep : boolean) : IXMLDOMNode;
   transformNode(stylesheet : IXMLDOMNode) : string;
   selectNodes(queryString : string) : IXMLDOMNodeList;
   selectSingleNode(queryString : string) : IXMLDOMNode;
   transformNodeToObject(stylesheet : IXMLDOMNode, outputObject) : void;
   substringData(offset : number, count : number) : string;
   appendData(data : string) : void;
   insertData(offset : number, data : string) : void;
   deleteData(offset : number, count : number) : void;
   replaceData(offset : number, count : number, data : string) : void;
   splitText(offset : number) : IXMLDOMText;
   /* Properties */
   readonly nodeName : string;
   nodeValue;
   readonly nodeType : DOMNodeType;
   readonly parentNode : IXMLDOMNode;
   readonly childNodes : IXMLDOMNodeList;
   readonly firstChild : IXMLDOMNode;
   readonly lastChild : IXMLDOMNode;
   readonly previousSibling : IXMLDOMNode;
   readonly nextSibling : IXMLDOMNode;
   readonly attributes : IXMLDOMNamedNodeMap;
   readonly ownerDocument : IXMLDOMDocument;
   readonly nodeTypeString : string;
   text : string;
   readonly specified : boolean;
   readonly definition : IXMLDOMNode;
   nodeTypedValue;
   dataType;
   readonly xml : string;
   readonly parsed : boolean;
   readonly namespaceURI : string;
   readonly prefix : string;
   readonly baseName : string;
   data : string;
   readonly length : number;
}

// [Guid("3f7f31ac-e15f-11d0-9c25-00c04fc99c8e")]
interface IXMLElement
{
   /* Methods */
   setAttribute(strPropertyName : string, PropertyValue) : void;
   getAttribute(strPropertyName : string);
   removeAttribute(strPropertyName : string) : void;
   addChild(pChildElem : IXMLElement, lIndex : number, lReserved : number) : void;
   removeChild(pChildElem : IXMLElement) : void;
   /* Properties */
   tagName : string;
   readonly parent : IXMLElement;
   readonly children : IXMLElementCollection;
   readonly type : number;
   text : string;
}

// [Guid("2b8de2ff-8d2d-11d1-b2fc-00c04fd915a9")]
interface IXMLElement2
{
   /* Methods */
   setAttribute(strPropertyName : string, PropertyValue) : void;
   getAttribute(strPropertyName : string);
   removeAttribute(strPropertyName : string) : void;
   addChild(pChildElem : IXMLElement2, lIndex : number, lReserved : number) : void;
   removeChild(pChildElem : IXMLElement2) : void;
   /* Properties */
   tagName : string;
   readonly parent : IXMLElement2;
   readonly children : IXMLElementCollection;
   readonly type : number;
   text : string;
   readonly attributes : IXMLElementCollection;
}

// [Guid("65725580-9b5d-11d0-9bfe-00c04fc99c8e")]
interface IXMLElementCollection
{
   /* Methods */
   GetEnumerator() : IEnumerator;
   item(var1?, var2?);
   /* Properties */
   length : number;
}

// [Guid("948c5ad3-c58d-11d0-9c0b-00c04fc99c8e")]
interface IXMLError
{
   /* Methods */
   GetErrorInfo(pErrorReturn : IntPtr<_xml_error> ) : void;
}

// [Guid("ed8c108d-4349-11d2-91a4-00c04f7969e8")]
interface IXMLHTTPRequest
{
   /* Methods */
   open(bstrMethod : string, bstrUrl : string, varAsync?, bstrUser?, bstrPassword?) : void;
   setRequestHeader(bstrHeader : string, bstrValue : string) : void;
   getResponseHeader(bstrHeader : string) : string;
   getAllResponseHeaders() : string;
   send(varBody?) : void;
   abort() : void;
   /* Properties */
   readonly status : number;
   readonly statusText : string;
   readonly responseXML;
   readonly responseText : string;
   readonly responseBody;
   readonly responseStream;
   readonly readyState : number;
   /*writeonly*/ onreadystatechange;
}

// [Guid("2933bf92-7b36-11d2-b20e-00c04f983e60")]
interface IXSLProcessor
{
   /* Methods */
   setStartMode(mode : string, namespaceURI? : string) : void;
   transform() : boolean;
   reset() : void;
   addParameter(baseName : string, parameter, namespaceURI? : string) : void;
   addObject(obj, namespaceURI : string) : void;
   /* Properties */
   input;
   readonly ownerTemplate : IXSLTemplate;
   readonly startMode : string;
   readonly startModeURI : string;
   output;
   readonly readyState : number;
   readonly stylesheet : IXMLDOMNode;
}

// [Guid("2933bf93-7b36-11d2-b20e-00c04f983e60")]
interface IXSLTemplate
{
   /* Methods */
   createProcessor() : IXSLProcessor;
   /* Properties */
   stylesheet : IXMLDOMNode;
}

// [Guid("3efaa425-272f-11d2-836f-0000f87a7782")]
interface IXTLRuntime
{
   /* Methods */
   insertBefore(newChild : IXMLDOMNode, refChild) : IXMLDOMNode;
   replaceChild(newChild : IXMLDOMNode, oldChild : IXMLDOMNode) : IXMLDOMNode;
   removeChild(childNode : IXMLDOMNode) : IXMLDOMNode;
   appendChild(newChild : IXMLDOMNode) : IXMLDOMNode;
   hasChildNodes() : boolean;
   cloneNode(deep : boolean) : IXMLDOMNode;
   transformNode(stylesheet : IXMLDOMNode) : string;
   selectNodes(queryString : string) : IXMLDOMNodeList;
   selectSingleNode(queryString : string) : IXMLDOMNode;
   transformNodeToObject(stylesheet : IXMLDOMNode, outputObject) : void;
   uniqueID(pNode : IXMLDOMNode) : number;
   depth(pNode : IXMLDOMNode) : number;
   childNumber(pNode : IXMLDOMNode) : number;
   ancestorChildNumber(bstrNodeName : string, pNode : IXMLDOMNode) : number;
   absoluteChildNumber(pNode : IXMLDOMNode) : number;
   formatIndex(lIndex : number, bstrFormat : string) : string;
   formatNumber(dblNumber : Double, bstrFormat : string) : string;
   formatDate(varDate, bstrFormat : string, varDestLocale?) : string;
   formatTime(varTime, bstrFormat : string, varDestLocale?) : string;
   /* Properties */
   readonly nodeName : string;
   nodeValue;
   readonly nodeType : DOMNodeType;
   readonly parentNode : IXMLDOMNode;
   readonly childNodes : IXMLDOMNodeList;
   readonly firstChild : IXMLDOMNode;
   readonly lastChild : IXMLDOMNode;
   readonly previousSibling : IXMLDOMNode;
   readonly nextSibling : IXMLDOMNode;
   readonly attributes : IXMLDOMNamedNodeMap;
   readonly ownerDocument : IXMLDOMDocument;
   readonly nodeTypeString : string;
   text : string;
   readonly specified : boolean;
   readonly definition : IXMLDOMNode;
   nodeTypedValue;
   dataType;
   readonly xml : string;
   readonly parsed : boolean;
   readonly namespaceURI : string;
   readonly prefix : string;
   readonly baseName : string;
}

// [Guid("4d7ff4ba-1565-4ea8-94e1-6e724a46f98d")]
interface MXHTMLWriter
{
}

// [Guid("4d7ff4ba-1565-4ea8-94e1-6e724a46f98d")]
interface MXHTMLWriter30
{
}

// [Guid("c90352f5-643c-4fbc-bb23-e996eb2d51fd")]
interface MXNamespaceManager
{
}

// [Guid("4d7ff4ba-1565-4ea8-94e1-6e724a46f98d")]
interface MXXMLWriter
{
}

// [Guid("4d7ff4ba-1565-4ea8-94e1-6e724a46f98d")]
interface MXXMLWriter30
{
}

// [Guid("f10d27cc-3ec0-415c-8ed8-77ab1c5e7262")]
interface SAXAttributes
{
}

// [Guid("f10d27cc-3ec0-415c-8ed8-77ab1c5e7262")]
interface SAXAttributes30
{
}

// [Guid("8c033caa-6cd6-4f73-b728-4531af74945f")]
interface SAXXMLReader
{
}

// [Guid("8c033caa-6cd6-4f73-b728-4531af74945f")]
interface SAXXMLReader30
{
}

// [Guid("2e9196bf-13ba-4dd4-91ca-6c571f281495")]
interface ServerXMLHTTP
{
}

// [Guid("2e9196bf-13ba-4dd4-91ca-6c571f281495")]
interface ServerXMLHTTP30
{
}

// [Guid("2b8de2fe-8d2d-11d1-b2fc-00c04fd915a9")]
interface XMLDocument
{
}

// [Guid("3efaa427-272f-11d2-836f-0000f87a7782")]
interface XMLDOMDocumentEvents
{
   /* Methods */
   ondataavailable() : void;
   onreadystatechange() : void;
}

// [Guid("ed8c108d-4349-11d2-91a4-00c04f7969e8")]
interface XMLHTTP
{
}

// [Guid("ed8c108d-4349-11d2-91a4-00c04f7969e8")]
interface XMLHTTP26
{
}

// [Guid("ed8c108d-4349-11d2-91a4-00c04f7969e8")]
interface XMLHTTP30
{
}

// [Guid("373984c8-b845-449b-91e7-45ac83036ade")]
interface XMLSchemaCache
{
}

// [Guid("373984c8-b845-449b-91e7-45ac83036ade")]
interface XMLSchemaCache26
{
}

// [Guid("373984c8-b845-449b-91e7-45ac83036ade")]
interface XMLSchemaCache30
{
}

// [Guid("2933bf93-7b36-11d2-b20e-00c04f983e60")]
interface XSLTemplate
{
}

// [Guid("2933bf93-7b36-11d2-b20e-00c04f983e60")]
interface XSLTemplate26
{
}

// [Guid("2933bf93-7b36-11d2-b20e-00c04f983e60")]
interface XSLTemplate30
{
}

interface _xml_error
{
   /* Fields */
   _nLine : number;
   _pchBuf : string;
   _cchBuf : number;
   _ich : number;
   _pszFound : string;
   _pszExpected : string;
   _reserved1 : number;
   _reserved2 : number;
}

enum _SCHEMACONTENTTYPE
{
   SCHEMACONTENTTYPE_EMPTY = 0,
   SCHEMACONTENTTYPE_TEXTONLY = 1,
   SCHEMACONTENTTYPE_ELEMENTONLY = 2,
   SCHEMACONTENTTYPE_MIXED = 3,
}

enum _SCHEMADERIVATIONMETHOD
{
   SCHEMADERIVATIONMETHOD_EMPTY = 0,
   SCHEMADERIVATIONMETHOD_SUBSTITUTION = 1,
   SCHEMADERIVATIONMETHOD_EXTENSION = 2,
   SCHEMADERIVATIONMETHOD_RESTRICTION = 4,
   SCHEMADERIVATIONMETHOD_LIST = 8,
   SCHEMADERIVATIONMETHOD_UNION = 16,
   SCHEMADERIVATIONMETHOD_ALL = 255,
   SCHEMADERIVATIONMETHOD_NONE = 256,
}

enum _SCHEMAPROCESSCONTENTS
{
   SCHEMAPROCESSCONTENTS_NONE = 0,
   SCHEMAPROCESSCONTENTS_SKIP = 1,
   SCHEMAPROCESSCONTENTS_LAX = 2,
   SCHEMAPROCESSCONTENTS_STRICT = 3,
}

enum _SCHEMATYPEVARIETY
{
   SCHEMATYPEVARIETY_NONE = -1,
   SCHEMATYPEVARIETY_ATOMIC = 0,
   SCHEMATYPEVARIETY_LIST = 1,
   SCHEMATYPEVARIETY_UNION = 2,
}

enum _SCHEMAUSE
{
   SCHEMAUSE_OPTIONAL = 0,
   SCHEMAUSE_PROHIBITED = 1,
   SCHEMAUSE_REQUIRED = 2,
}

enum _SCHEMAWHITESPACE
{
   SCHEMAWHITESPACE_NONE = -1,
   SCHEMAWHITESPACE_PRESERVE = 0,
   SCHEMAWHITESPACE_REPLACE = 1,
   SCHEMAWHITESPACE_COLLAPSE = 2,
}

enum _SERVERXMLHTTP_OPTION
{
   SXH_OPTION_URL = -1,
   SXH_OPTION_URL_CODEPAGE = 0,
   SXH_OPTION_ESCAPE_PERCENT_IN_URL = 1,
   SXH_OPTION_IGNORE_SERVER_SSL_CERT_ERROR_FLAGS = 2,
   SXH_OPTION_SELECT_CLIENT_SSL_CERT = 3,
}

enum _SOMITEMTYPE
{
   SOMITEM_SCHEMA = 4096,
   SOMITEM_ATTRIBUTE = 4097,
   SOMITEM_ATTRIBUTEGROUP = 4098,
   SOMITEM_NOTATION = 4099,
   SOMITEM_ANNOTATION = 4100,
   SOMITEM_IDENTITYCONSTRAINT = 4352,
   SOMITEM_KEY = 4353,
   SOMITEM_KEYREF = 4354,
   SOMITEM_UNIQUE = 4355,
   SOMITEM_ANYTYPE = 8192,
   SOMITEM_DATATYPE = 8448,
   SOMITEM_DATATYPE_ANYTYPE = 8449,
   SOMITEM_DATATYPE_ANYURI = 8450,
   SOMITEM_DATATYPE_BASE64BINARY = 8451,
   SOMITEM_DATATYPE_BOOLEAN = 8452,
   SOMITEM_DATATYPE_BYTE = 8453,
   SOMITEM_DATATYPE_DATE = 8454,
   SOMITEM_DATATYPE_DATETIME = 8455,
   SOMITEM_DATATYPE_DAY = 8456,
   SOMITEM_DATATYPE_DECIMAL = 8457,
   SOMITEM_DATATYPE_DOUBLE = 8458,
   SOMITEM_DATATYPE_DURATION = 8459,
   SOMITEM_DATATYPE_ENTITIES = 8460,
   SOMITEM_DATATYPE_ENTITY = 8461,
   SOMITEM_DATATYPE_FLOAT = 8462,
   SOMITEM_DATATYPE_HEXBINARY = 8463,
   SOMITEM_DATATYPE_ID = 8464,
   SOMITEM_DATATYPE_IDREF = 8465,
   SOMITEM_DATATYPE_IDREFS = 8466,
   SOMITEM_DATATYPE_INT = 8467,
   SOMITEM_DATATYPE_INTEGER = 8468,
   SOMITEM_DATATYPE_LANGUAGE = 8469,
   SOMITEM_DATATYPE_LONG = 8470,
   SOMITEM_DATATYPE_MONTH = 8471,
   SOMITEM_DATATYPE_MONTHDAY = 8472,
   SOMITEM_DATATYPE_NAME = 8473,
   SOMITEM_DATATYPE_NCNAME = 8474,
   SOMITEM_DATATYPE_NEGATIVEINTEGER = 8475,
   SOMITEM_DATATYPE_NMTOKEN = 8476,
   SOMITEM_DATATYPE_NMTOKENS = 8477,
   SOMITEM_DATATYPE_NONNEGATIVEINTEGER = 8478,
   SOMITEM_DATATYPE_NONPOSITIVEINTEGER = 8479,
   SOMITEM_DATATYPE_NORMALIZEDSTRING = 8480,
   SOMITEM_DATATYPE_NOTATION = 8481,
   SOMITEM_DATATYPE_POSITIVEINTEGER = 8482,
   SOMITEM_DATATYPE_QNAME = 8483,
   SOMITEM_DATATYPE_SHORT = 8484,
   SOMITEM_DATATYPE_STRING = 8485,
   SOMITEM_DATATYPE_TIME = 8486,
   SOMITEM_DATATYPE_TOKEN = 8487,
   SOMITEM_DATATYPE_UNSIGNEDBYTE = 8488,
   SOMITEM_DATATYPE_UNSIGNEDINT = 8489,
   SOMITEM_DATATYPE_UNSIGNEDLONG = 8490,
   SOMITEM_DATATYPE_UNSIGNEDSHORT = 8491,
   SOMITEM_DATATYPE_YEAR = 8492,
   SOMITEM_DATATYPE_YEARMONTH = 8493,
   SOMITEM_DATATYPE_ANYSIMPLETYPE = 8703,
   SOMITEM_SIMPLETYPE = 8704,
   SOMITEM_COMPLEXTYPE = 9216,
   SOMITEM_PARTICLE = 16384,
   SOMITEM_ANY = 16385,
   SOMITEM_ANYATTRIBUTE = 16386,
   SOMITEM_ELEMENT = 16387,
   SOMITEM_GROUP = 16640,
   SOMITEM_ALL = 16641,
   SOMITEM_CHOICE = 16642,
   SOMITEM_SEQUENCE = 16643,
   SOMITEM_EMPTYPARTICLE = 16644,
   SOMITEM_NULL = 2048,
   SOMITEM_NULL_TYPE = 10240,
   SOMITEM_NULL_ANY = 18433,
   SOMITEM_NULL_ANYATTRIBUTE = 18434,
   SOMITEM_NULL_ELEMENT = 18435,
}

enum _SXH_PROXY_SETTING
{
   SXH_PROXY_SET_DEFAULT = 0,
   SXH_PROXY_SET_PRECONFIG = 0,
   SXH_PROXY_SET_DIRECT = 1,
   SXH_PROXY_SET_PROXY = 2,
}

enum _SXH_SERVER_CERT_OPTION
{
   SXH_SERVER_CERT_IGNORE_UNKNOWN_CA = 256,
   SXH_SERVER_CERT_IGNORE_WRONG_USAGE = 512,
   SXH_SERVER_CERT_IGNORE_CERT_CN_INVALID = 4096,
   SXH_SERVER_CERT_IGNORE_CERT_DATE_INVALID = 8192,
   SXH_SERVER_CERT_IGNORE_ALL_SERVER_ERRORS = 13056,
}

enum DOMNodeType
{
   NODE_INVALID = 0,
   NODE_ELEMENT = 1,
   NODE_ATTRIBUTE = 2,
   NODE_TEXT = 3,
   NODE_CDATA_SECTION = 4,
   NODE_ENTITY_REFERENCE = 5,
   NODE_ENTITY = 6,
   NODE_PROCESSING_INSTRUCTION = 7,
   NODE_COMMENT = 8,
   NODE_DOCUMENT = 9,
   NODE_DOCUMENT_TYPE = 10,
   NODE_DOCUMENT_FRAGMENT = 11,
   NODE_NOTATION = 12,
}

enum SCHEMACONTENTTYPE
{
   SCHEMACONTENTTYPE_EMPTY = 0,
   SCHEMACONTENTTYPE_TEXTONLY = 1,
   SCHEMACONTENTTYPE_ELEMENTONLY = 2,
   SCHEMACONTENTTYPE_MIXED = 3,
}

enum SCHEMADERIVATIONMETHOD
{
   SCHEMADERIVATIONMETHOD_EMPTY = 0,
   SCHEMADERIVATIONMETHOD_SUBSTITUTION = 1,
   SCHEMADERIVATIONMETHOD_EXTENSION = 2,
   SCHEMADERIVATIONMETHOD_RESTRICTION = 4,
   SCHEMADERIVATIONMETHOD_LIST = 8,
   SCHEMADERIVATIONMETHOD_UNION = 16,
   SCHEMADERIVATIONMETHOD_ALL = 255,
   SCHEMADERIVATIONMETHOD_NONE = 256,
}

enum SCHEMAPROCESSCONTENTS
{
   SCHEMAPROCESSCONTENTS_NONE = 0,
   SCHEMAPROCESSCONTENTS_SKIP = 1,
   SCHEMAPROCESSCONTENTS_LAX = 2,
   SCHEMAPROCESSCONTENTS_STRICT = 3,
}

enum SCHEMATYPEVARIETY
{
   SCHEMATYPEVARIETY_NONE = -1,
   SCHEMATYPEVARIETY_ATOMIC = 0,
   SCHEMATYPEVARIETY_LIST = 1,
   SCHEMATYPEVARIETY_UNION = 2,
}

enum SCHEMAUSE
{
   SCHEMAUSE_OPTIONAL = 0,
   SCHEMAUSE_PROHIBITED = 1,
   SCHEMAUSE_REQUIRED = 2,
}

enum SCHEMAWHITESPACE
{
   SCHEMAWHITESPACE_NONE = -1,
   SCHEMAWHITESPACE_PRESERVE = 0,
   SCHEMAWHITESPACE_REPLACE = 1,
   SCHEMAWHITESPACE_COLLAPSE = 2,
}

enum SERVERXMLHTTP_OPTION
{
   SXH_OPTION_URL = -1,
   SXH_OPTION_URL_CODEPAGE = 0,
   SXH_OPTION_ESCAPE_PERCENT_IN_URL = 1,
   SXH_OPTION_IGNORE_SERVER_SSL_CERT_ERROR_FLAGS = 2,
   SXH_OPTION_SELECT_CLIENT_SSL_CERT = 3,
}

enum SOMITEMTYPE
{
   SOMITEM_SCHEMA = 4096,
   SOMITEM_ATTRIBUTE = 4097,
   SOMITEM_ATTRIBUTEGROUP = 4098,
   SOMITEM_NOTATION = 4099,
   SOMITEM_ANNOTATION = 4100,
   SOMITEM_IDENTITYCONSTRAINT = 4352,
   SOMITEM_KEY = 4353,
   SOMITEM_KEYREF = 4354,
   SOMITEM_UNIQUE = 4355,
   SOMITEM_ANYTYPE = 8192,
   SOMITEM_DATATYPE = 8448,
   SOMITEM_DATATYPE_ANYTYPE = 8449,
   SOMITEM_DATATYPE_ANYURI = 8450,
   SOMITEM_DATATYPE_BASE64BINARY = 8451,
   SOMITEM_DATATYPE_BOOLEAN = 8452,
   SOMITEM_DATATYPE_BYTE = 8453,
   SOMITEM_DATATYPE_DATE = 8454,
   SOMITEM_DATATYPE_DATETIME = 8455,
   SOMITEM_DATATYPE_DAY = 8456,
   SOMITEM_DATATYPE_DECIMAL = 8457,
   SOMITEM_DATATYPE_DOUBLE = 8458,
   SOMITEM_DATATYPE_DURATION = 8459,
   SOMITEM_DATATYPE_ENTITIES = 8460,
   SOMITEM_DATATYPE_ENTITY = 8461,
   SOMITEM_DATATYPE_FLOAT = 8462,
   SOMITEM_DATATYPE_HEXBINARY = 8463,
   SOMITEM_DATATYPE_ID = 8464,
   SOMITEM_DATATYPE_IDREF = 8465,
   SOMITEM_DATATYPE_IDREFS = 8466,
   SOMITEM_DATATYPE_INT = 8467,
   SOMITEM_DATATYPE_INTEGER = 8468,
   SOMITEM_DATATYPE_LANGUAGE = 8469,
   SOMITEM_DATATYPE_LONG = 8470,
   SOMITEM_DATATYPE_MONTH = 8471,
   SOMITEM_DATATYPE_MONTHDAY = 8472,
   SOMITEM_DATATYPE_NAME = 8473,
   SOMITEM_DATATYPE_NCNAME = 8474,
   SOMITEM_DATATYPE_NEGATIVEINTEGER = 8475,
   SOMITEM_DATATYPE_NMTOKEN = 8476,
   SOMITEM_DATATYPE_NMTOKENS = 8477,
   SOMITEM_DATATYPE_NONNEGATIVEINTEGER = 8478,
   SOMITEM_DATATYPE_NONPOSITIVEINTEGER = 8479,
   SOMITEM_DATATYPE_NORMALIZEDSTRING = 8480,
   SOMITEM_DATATYPE_NOTATION = 8481,
   SOMITEM_DATATYPE_POSITIVEINTEGER = 8482,
   SOMITEM_DATATYPE_QNAME = 8483,
   SOMITEM_DATATYPE_SHORT = 8484,
   SOMITEM_DATATYPE_STRING = 8485,
   SOMITEM_DATATYPE_TIME = 8486,
   SOMITEM_DATATYPE_TOKEN = 8487,
   SOMITEM_DATATYPE_UNSIGNEDBYTE = 8488,
   SOMITEM_DATATYPE_UNSIGNEDINT = 8489,
   SOMITEM_DATATYPE_UNSIGNEDLONG = 8490,
   SOMITEM_DATATYPE_UNSIGNEDSHORT = 8491,
   SOMITEM_DATATYPE_YEAR = 8492,
   SOMITEM_DATATYPE_YEARMONTH = 8493,
   SOMITEM_DATATYPE_ANYSIMPLETYPE = 8703,
   SOMITEM_SIMPLETYPE = 8704,
   SOMITEM_COMPLEXTYPE = 9216,
   SOMITEM_PARTICLE = 16384,
   SOMITEM_ANY = 16385,
   SOMITEM_ANYATTRIBUTE = 16386,
   SOMITEM_ELEMENT = 16387,
   SOMITEM_GROUP = 16640,
   SOMITEM_ALL = 16641,
   SOMITEM_CHOICE = 16642,
   SOMITEM_SEQUENCE = 16643,
   SOMITEM_EMPTYPARTICLE = 16644,
   SOMITEM_NULL = 2048,
   SOMITEM_NULL_TYPE = 10240,
   SOMITEM_NULL_ANY = 18433,
   SOMITEM_NULL_ANYATTRIBUTE = 18434,
   SOMITEM_NULL_ELEMENT = 18435,
}

enum SXH_PROXY_SETTING
{
   SXH_PROXY_SET_DEFAULT = 0,
   SXH_PROXY_SET_PRECONFIG = 0,
   SXH_PROXY_SET_DIRECT = 1,
   SXH_PROXY_SET_PROXY = 2,
}

enum SXH_SERVER_CERT_OPTION
{
   SXH_SERVER_CERT_IGNORE_UNKNOWN_CA = 256,
   SXH_SERVER_CERT_IGNORE_WRONG_USAGE = 512,
   SXH_SERVER_CERT_IGNORE_CERT_CN_INVALID = 4096,
   SXH_SERVER_CERT_IGNORE_CERT_DATE_INVALID = 8192,
   SXH_SERVER_CERT_IGNORE_ALL_SERVER_ERRORS = 13056,
}

enum tagDOMNodeType
{
   NODE_INVALID = 0,
   NODE_ELEMENT = 1,
   NODE_ATTRIBUTE = 2,
   NODE_TEXT = 3,
   NODE_CDATA_SECTION = 4,
   NODE_ENTITY_REFERENCE = 5,
   NODE_ENTITY = 6,
   NODE_PROCESSING_INSTRUCTION = 7,
   NODE_COMMENT = 8,
   NODE_DOCUMENT = 9,
   NODE_DOCUMENT_TYPE = 10,
   NODE_DOCUMENT_FRAGMENT = 11,
   NODE_NOTATION = 12,
}

enum tagXMLEMEM_TYPE
{
   XMLELEMTYPE_ELEMENT = 0,
   XMLELEMTYPE_TEXT = 1,
   XMLELEMTYPE_COMMENT = 2,
   XMLELEMTYPE_DOCUMENT = 3,
   XMLELEMTYPE_DTD = 4,
   XMLELEMTYPE_PI = 5,
   XMLELEMTYPE_OTHER = 6,
}

enum XMLELEM_TYPE
{
   XMLELEMTYPE_ELEMENT = 0,
   XMLELEMTYPE_TEXT = 1,
   XMLELEMTYPE_COMMENT = 2,
   XMLELEMTYPE_DOCUMENT = 3,
   XMLELEMTYPE_DTD = 4,
   XMLELEMTYPE_PI = 5,
   XMLELEMTYPE_OTHER = 6,
}
