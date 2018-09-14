#ifndef SNIS_MULTIVERSE_H__
#define SNIS_MULTIVERSE_H__

#include "snis_packet.h"

#define SNIS_MULTIVERSE_VERSION "SNISMULTIVERSE0002"

#define SNISMV_OPCODE_NOOP 0x00
#define SNISMV_OPCODE_LOOKUP_BRIDGE 0x01
#define SNISMV_OPCODE_UPDATE_BRIDGE 0x02
#define SNISMV_OPCODE_VERIFY	    0x03
#define SNISMV_OPCODE_VERIFY_CREATE (SNISMV_OPCODE_VERIFY + 0)
#define SNISMV_OPCODE_VERIFY_EXISTS (SNISMV_OPCODE_VERIFY + 1)
#define SNISMV_OPCODE_VERIFICATION_RESPONSE 0x05
#define SNISMV_VERIFICATION_RESPONSE_FAIL 0x00
#define SNISMV_VERIFICATION_RESPONSE_PASS 0x01
#define SNISMV_VERIFICATION_RESPONSE_TOO_MANY_BRIDGES 0x02

#endif
