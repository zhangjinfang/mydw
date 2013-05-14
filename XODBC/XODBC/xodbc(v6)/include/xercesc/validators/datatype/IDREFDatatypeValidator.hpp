/*
 * Copyright 1999-2001,2004 The Apache Software Foundation.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * $Id: IDREFDatatypeValidator.hpp,v 1.1 2007/05/22 02:39:59 linkun Exp $
 */

#if !defined(IDREF_DATATYPEVALIDATOR_HPP)
#define IDREF_DATATYPEVALIDATOR_HPP

#include <xercesc/validators/datatype/StringDatatypeValidator.hpp>
#include <xercesc/framework/XMLRefInfo.hpp>

XERCES_CPP_NAMESPACE_BEGIN

class VALIDATORS_EXPORT IDREFDatatypeValidator : public StringDatatypeValidator
{
public:

    // -----------------------------------------------------------------------
    //  Public ctor/dtor
    // -----------------------------------------------------------------------
	/** @name Constructors and Destructor */
    //@{

    IDREFDatatypeValidator
    (
        MemoryManager* const manager = XMLPlatformUtils::fgMemoryManager
    );
    IDREFDatatypeValidator
    (
        DatatypeValidator* const baseValidator
        , RefHashTableOf<KVStringPair>* const facets
        , RefArrayVectorOf<XMLCh>* const enums
        , const int finalSet
        , MemoryManager* const manager = XMLPlatformUtils::fgMemoryManager
    );

    virtual ~IDREFDatatypeValidator();

	//@}

    // -----------------------------------------------------------------------
    // Validation methods
    // -----------------------------------------------------------------------
    /** @name Validation Function */
    //@{

    /**
     * validate that a string matches the boolean datatype
     * @param content A string containing the content to be validated
     *
     * @exception throws InvalidDatatypeException if the content is
     * is not valid.
     */

	virtual void validate
                 (
                  const XMLCh*             const content
                ,       ValidationContext* const context = 0
                ,       MemoryManager*     const manager = XMLPlatformUtils::fgMemoryManager
                  );

    //@}

    /**
      * Returns an instance of the base datatype validator class
	  * Used by the DatatypeValidatorFactory.
      */
    virtual DatatypeValidator* newInstance
    (
        RefHashTableOf<KVStringPair>* const facets
        , RefArrayVectorOf<XMLCh>* const enums
        , const int finalSet
        , MemoryManager* const manager = XMLPlatformUtils::fgMemoryManager
    );

    //deprecated
    inline void setIDRefList(RefHashTableOf<XMLRefInfo>* fIDRefList);

    /***
     * Support for Serialization/De-serialization
     ***/
    DECL_XSERIALIZABLE(IDREFDatatypeValidator)

protected:

    //
    // ctor provided to be used by derived classes
    //
    IDREFDatatypeValidator
    (
        DatatypeValidator* const baseValidator
        , RefHashTableOf<KVStringPair>* const facets
        , const int finalSet
        , const ValidatorType type
        , MemoryManager* const manager = XMLPlatformUtils::fgMemoryManager
    );

    virtual void checkValueSpace(const XMLCh* const content
                                , MemoryManager* const manager);

private:
    // -----------------------------------------------------------------------
    //  Unimplemented constructors and operators
    // -----------------------------------------------------------------------
    IDREFDatatypeValidator(const IDREFDatatypeValidator&);
    IDREFDatatypeValidator& operator=(const IDREFDatatypeValidator&);

    // -----------------------------------------------------------------------
    //  Private data members
    //
    //
    // -----------------------------------------------------------------------

};

// -----------------------------------------------------------------------
// Validation methods
// -----------------------------------------------------------------------
inline void IDREFDatatypeValidator::setIDRefList(RefHashTableOf<XMLRefInfo>* )
{
}

XERCES_CPP_NAMESPACE_END

#endif

/**
  * End of file IDREFDatatypeValidator.hpp
  */