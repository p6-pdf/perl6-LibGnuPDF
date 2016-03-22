use v6;

module LibGnuPDF {
    use NativeCall;
    use NativeCall::Types;

    sub find-lib {
	$*VM.platform-library-name('gnupdf'.IO).Str;
    }
    
    #| see pdf.h
    my constant pdf_bool_t is export(:types, :DEFAULT) = NativeCall::Types::bool;
    my constant pdf_domain_t is export(:types, :DEFAULT) = NativeCall::Types::long;
    my constant pdf_char_t is export(:types, :DEFAULT) = uint8;
    my constant pdf_error_domain_t is export(:types, :DEFAULT) = NativeCall::Types::long;
    my constant pdf_hash_t is export(:types, :DEFAULT) = OpaquePointer;

    my constant pdf_error_t is export(:types, :DEFAULT) = OpaquePointer;
    my constant pdf_message_t is export(:types, :DEFAULT) = Pointer[CArray[uint8]];
    my constant pdf_size_t is export(:types, :DEFAULT) = NativeCall::Types::long;
    my constant pdf_status_t is export(:types, :DEFAULT) = NativeCall::Types::long;
    my constant pdf_stm_t is export(:types, :DEFAULT) = OpaquePointer;

    our sub pdf_hash_new(Pointer[pdf_error_t])
        returns pdf_hash_t
        is native(&find-lib) { * }

    our sub pdf_error_get_status(pdf_error_t is rw)
        returns pdf_status_t
        is native(&find-lib) { * }

    our sub pdf_error_get_domain(pdf_error_t is rw)
        returns pdf_domain_t
        is native(&find-lib) { * }

    our sub pdf_error_get_message(pdf_error_t is rw)
        returns pdf_message_t
        is native(&find-lib) { * }

  my Int enum pdf_stm_filter_type_E is export(:types, :DEFAULT) «
  :PDF_STM_FILTER_UNKNOWN(-1)
  :PDF_STM_FILTER_NULL(0)
  PDF_STM_FILTER_AHEX_ENC
  PDF_STM_FILTER_AHEX_DEC
  PDF_STM_FILTER_A85_ENC
  PDF_STM_FILTER_A85_DEC
  PDF_STM_FILTER_LZW_ENC
  PDF_STM_FILTER_LZW_DEC
  PDF_STM_FILTER_FLATE_ENC
  PDF_STM_FILTER_FLATE_DEC
  PDF_STM_FILTER_RL_ENC
  PDF_STM_FILTER_RL_DEC
  PDF_STM_FILTER_CCITTFAX_ENC
  PDF_STM_FILTER_CCITTFAX_DEC
  PDF_STM_FILTER_JBIG2_ENC
  PDF_STM_FILTER_JBIG2_DEC
  PDF_STM_FILTER_DCT_ENC
  PDF_STM_FILTER_DCT_DEC
  PDF_STM_FILTER_JPX_ENC
  PDF_STM_FILTER_JPX_DEC
  PDF_STM_FILTER_PRED_ENC
  PDF_STM_FILTER_PRED_DEC
  PDF_STM_FILTER_AESV2_ENC
  PDF_STM_FILTER_AESV2_DEC
  PDF_STM_FILTER_V2_ENC
  PDF_STM_FILTER_V2_DEC
  PDF_STM_FILTER_MD5_ENC
  PDF_STM_FILTER_LAST
  »;
  my subset pdf_stm_filter_type_e of ulong where pdf_stm_filter_type_E;
  
  our sub pdf_stm_install_filter(pdf_stm_t,
                                 pdf_stm_filter_type_e,
                                 pdf_hash_t,
                                 pdf_error_t)
    returns pdf_bool_t
    is native(&find-lib) { * }

  our sub pdf_stm_supported_filter_p(pdf_stm_filter_type_e)
    returns pdf_bool_t
    is native(&find-lib) { * }
  
}